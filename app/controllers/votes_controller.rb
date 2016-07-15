class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])
    vote = Vote.create_or_cancel(current_user.id,
                                 params[:review_id],
                                 params[:vote_type])
    flash[:success] = vote.message
    redirect_to venue_path(@review.venue)
  end
end
