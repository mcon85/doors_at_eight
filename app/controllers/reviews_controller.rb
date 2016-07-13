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
      send_new_review(@review)
      redirect_to venue_path(@venue)
    else
      flash[:error] = 'Problem saving review.'
      @errors = @review.errors.full_messages
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @venue = Venue.find(params[:venue_id])
  end

  def update
    @review = Review.find(params[:id])
    @venue = Venue.find(params[:venue_id])

    if @review.update(review_params)
      flash[:success] = 'Review saved successfully'
      redirect_to venue_path(@venue)
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

  def send_new_review(review)
    if !Rails.env.test?
      pusher = PusherService.new('review_channel', 'new_review')
      pusher.trigger(
                      review: {
                                 id: review.id,
                                 body: review.body,
                                 rating: review.rating,
                                 venue_name: review.venue.name,
                                 venue_id: review.venue.id,
                                 created_at: review.created_at
                               }
                    )
    end
  end
end
