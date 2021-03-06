class Api::ReviewsController < ApiController
  def index
    reviews = Review.where("body <> ''").order(created_at: :desc).limit(4)
    review_map = reviews.map do |review|
      {
        id: review.id,
        body: review.body,
        rating: review.rating,
        venue_name: review.venue.name,
        venue_id: review.venue.id,
        created_at: review.created_at
      }
    end
    render json: { reviews: review_map }, status: :ok
  end

  def destroy
    Review.destroy(params[:id])

    render json: { message: 'Review deleted' }, status: :ok
  end
end
