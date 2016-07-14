class Api::Venues::ReviewsController < ApplicationController
  def index
    venue = Venue.find(params[:venue_id])
    reviews = venue.reviews

    render json: { reviews: reviews }, status: :ok
  end
end
