class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @venue = Venue.find(params[:venue_id])
  end

  def create
    @review = Review.new(review_params)
    @venue = Venue.find(params[:venue_id])
    @review.venue = @venue
    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to venue_path(@venue)
    else
      flash[:error] = "Problem saving review. #{@review.errors.full_messages.join(', ')}"
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
