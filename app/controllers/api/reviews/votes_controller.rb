class Api::Reviews::VotesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    vote = Vote.where(user: current_user, review_id: params[:review_id]).first
    review = Review.find(params[:review_id])
    render json: { vote: vote, vote_count: review.vote_count }, status: :ok
  end

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

      message = if vote.save
                  success_message
                else
                  'There was a problem saving that upvote.'
                end
    end

    if vote.destroyed?
      vote = nil
    end

    render json: { message: message,
                   vote: vote,
                   vote_count: @review.vote_count }, status: :ok
  end
end
