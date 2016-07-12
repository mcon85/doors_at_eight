class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @review = Review.find(params[:review_id])

    if(current_user.check_vote_status_of(@review))
      Vote.where(user: current_user, review: @review).first.destroy
      flash[:success] = 'Your vote was removed.'
    else
      vote = Vote.new(user: current_user,
                      review: @review,
                      vote_type: params[:vote_type])

      if vote.save
        flash[:success] = 'Thanks for upvoting!'
      else
        flash[:alert] = 'There was a problem saving that upvote.'
      end
    end

    redirect_to venue_path(@review.venue)
  end
end
