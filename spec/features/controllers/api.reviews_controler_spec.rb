require 'rails_helper'

RSpec.describe Api::ReviewsController, type: :controller do
  describe 'GET /api/reviews' do
    it ' retrieves the 4 reviews' do

     create_list(:review, 4)
     reviews = create_list(:review, 4)

      get :index
      json = JSON.parse(response.body)
      ids = json['reviews'].map { |c| c['id'] }

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(ids).to match_array(reviews.map(&:id))
    end
  end
end
