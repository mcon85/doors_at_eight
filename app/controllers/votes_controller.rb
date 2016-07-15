class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = Vote.create_or_cancel(current_user.id,
                                 params[:review_id],
                                 params[:vote_type])
    if vote
      flash[:success] = vote.message
    else
      flash[:succes] = 'Your vote was removed'
    end

    @review = Review.find(params[:review_id])

    redirect_to venue_path(@review.venue)
  end
end
