class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    vote = Vote.where(user: current_user, review: @review).first

    success_message = "Thanks for #{params[:vote_type]}-voting!"

    if vote
      if vote.vote_type == params[:vote_type]
        vote.destroy
        flash[:success] = 'Your vote was removed.'
      else
        vote.update(vote_type: params[:vote_type])
        flash[:success] = success_message
      end
    else
      vote = Vote.new(user: current_user,
                      review: @review,
                      vote_type: params[:vote_type])

      if vote.save
        flash[:success] = success_message
      else
        flash[:alert] = 'There was a problem saving that upvote.'
      end
    end

    redirect_to venue_path(@review.venue)
  end
end
