require 'rails_helper'

describe Api::Reviews::VotesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.create(:review) }

  describe 'GET index' do
    it 'returns a list of votes' do
      vote = FactoryGirl.create(:vote, user_id: user.id, review_id: review.id,
                                vote_type: 'up')

      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)

      get :index, review_id: review.id
      json = JSON.parse(response.body)

      expect(response.content_type).to eq('application/json')
      expect(response).to have_http_status(:ok)
      expect(json['vote']['id']).to eq(vote.id)
      expect(json['vote']['user_id']).to eq(vote.user_id)
      expect(json['vote']['review_id']).to eq(vote.review_id)
      expect(json['vote']['vote_type']).to eq(vote.vote_type)
      expect(json['vote_count']).to eq(1)
    end

    describe 'POST #create' do
      it 'posts a new vote' do
        vote = FactoryGirl.build(:vote, user_id: user.id, review_id: review.id,
                                  vote_type: 'up')

        allow(request.env['warden']).to receive(:authenticate!).and_return(user)
        allow(controller).to receive(:current_user).and_return(user)

        post :create, review_id: review.id, vote_type: vote.vote_type
        json = JSON.parse(response.body)

        expect(response.content_type).to eq('application/json')
        expect(response).to have_http_status(:ok)
        expect(json['vote']['id']).to be_truthy
        expect(json['vote']['user_id']).to eq(vote.user_id)
        expect(json['vote']['review_id']).to eq(vote.review_id)
        expect(json['vote']['vote_type']).to eq(vote.vote_type)
        expect(json['vote_count']).to eq(1)
      end
    end
  end
end
