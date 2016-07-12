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
      flash[:notice] = 'Review added successfully'
      redirect_to venue_path(@venue)
    else
      flash[:error] = 'Problem saving review.'
      @errors = @review.errors.full_messages
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    flash[:success] = 'Review deleted successfully'
    redirect_to venues_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
