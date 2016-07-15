class Api::Reviews::VotesController < ApplicationController
  before_action :authenticate_user!

  def index
    vote = if current_user
             Vote.where(user: current_user, review_id: params[:review_id]).first
           end

    review = Review.find(params[:review_id])
    render json: { vote: vote, vote_count: review.vote_count }, status: :ok
  end

  def create
    @review = Review.find(params[:review_id])
    vote = Vote.create_or_cancel(current_user.id,
                                 params[:review_id],
                                 params[:vote_type])

    render json: { vote: vote,
                   vote_count: @review.vote_count }, status: :ok
  end
end
