require 'rails_helper'

describe Api::Venues::ReviewsController, type: :controller do
  describe 'GET /api/venues/:venue_id/reviews' do
    it 'retrieves the reviews for speific venue' do
      venue = create(:venue)
      reviews = create_list(:review, 4, venue: venue)

      get :index, venue_id: venue.id
      json = JSON.parse(response.body)
      ids = json['reviews'].map { |c| c['id'] }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(ids).to match_array(reviews.map(&:id))
    end
  end
end
