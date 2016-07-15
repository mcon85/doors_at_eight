require 'rails_helper'

describe Api::ReviewsController, type: :controller do
  describe 'GET /api/reviews' do
    it 'retrieves the 4 reviews' do
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

  describe 'POST #destroy' do
    it 'deletes a review' do
      review = FactoryGirl.create(:review)

      post :destroy, id: review.id
      json = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(json['message']).to eq('Review deleted')
      expect { Review.find(review.id) }
        .to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
