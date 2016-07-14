class Api::Reviews::VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    vote = Vote.where(user: current_user, review: @review).first

    success_message = "Thanks for #{params[:vote_type]}-voting!"

    if vote
      if vote.vote_type == params[:vote_type]
        vote.destroy
        message = 'Your vote was removed.'
      else
        vote.update(vote_type: params[:vote_type])
        message = success_message
      end
    else
      vote = Vote.new(user: current_user,
                      review: @review,
                      vote_type: params[:vote_type])

      if vote.save
        message = success_message
      else
        message = 'There was a problem saving that upvote.'
      end
    end

    render json: { message: message }, status: :ok
  end
end
