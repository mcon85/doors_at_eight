class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [
                                             :new,
                                             :create,
                                             :edit,
                                             :update,
                                             :destroy
                                           ]
  before_action :check_permissions, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
    @venue = Venue.find(params[:venue_id])
  end

  def create
    @review = Review.new(review_params)
    @venue = Venue.find(params[:venue_id])
    @review.venue = @venue
    @review.user_id = current_user.id

    if @review.save
      flash[:notice] = 'Review added successfully'
      send_new_review(@review)
      send_email(@review, @venue)
      send_tweet(@review, @venue)
      redirect_to venue_path(@venue)
    else
      flash[:alert] = 'Problem saving review.'
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
      flash[:alert] = 'Problem saving review.'
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    flash[:success] = 'Review deleted successfully'
    redirect_to venue_path(@review.venue_id)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

  def send_new_review(review)
    if !Rails.env.test?
      pusher = PusherService.new('review_channel', 'new_review')
      pusher.trigger(review: {
                                id: review.id,
                                body: review.body,
                                rating: review.rating,
                                venue_name: review.venue.name,
                                venue_id: review.venue.id,
                                created_at: review.created_at
                     })
    end
  end

  def send_email(review, venue)
    unless review.body.empty?
      email = venue.user.email
      NotificationMailer.review_notification(email, venue, review).deliver_later
    end
  end

  def send_tweet(review, venue)
    unless review.body.empty?
      twitter = TwitterService.new
      twitter.send_tweet("Review: #{venue.name}: "\
                         "#{review.short_body} #{venue_url(venue)}")
    end
  end
end
