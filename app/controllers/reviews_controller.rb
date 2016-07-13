class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [
                                             :new,
                                             :create,
                                             :edit,
                                             :update,
                                             :destroy
                                           ]
  before_action :check_owner, only: [:edit, :update, :destroy]

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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:success] = 'Review saved successfully'
      redirect_to venue_path(@review.venue)
    else
      flash[:error] = 'Problem saving review.'
      render :edit
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
