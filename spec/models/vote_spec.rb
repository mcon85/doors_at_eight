require 'rails_helper'

describe Vote, type: :model do
  it { should have_valid(:vote_type).when('up') }
  it { should have_valid(:vote_type).when('down') }
  it { should_not have_valid(:vote_type).when('whatever', nil, '') }

  it { should belong_to(:user) }
  it { should belong_to(:review) }

  describe '.create_or_cancel' do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    it 'creates a new vote if one does not exist' do
        vote = Vote.create_or_cancel(user.id, review.id, 'up')

        expect(vote).not_to be(nil)
        expect(vote.vote_type).to eq('up')
        expect(vote.review_id).to eq(review.id)
        expect(vote.user_id).to eq(user.id)
    end

    it 'switches the vote status if the vote_type is switched' do
      FactoryGirl.create(:vote, user: user, review: review, vote_type: 'up')
      vote = Vote.create_or_cancel(user.id, review.id, 'down')

      expect(vote).not_to be(nil)
      expect(vote.vote_type).to eq('down')
      expect(vote.review_id).to eq(review.id)
      expect(vote.user_id).to eq(user.id)
    end

    it 'cancels the vote if the same vote status is submitted' do
      FactoryGirl.create(:vote, user: user, review: review, vote_type: 'up')
      vote = Vote.create_or_cancel(user.id, review.id, 'up')

      expect(vote).to be(nil)
    end

    it 'returns an error if the vote could not be saved' do
      vote = Vote.create_or_cancel(nil, nil, nil)

      expect(vote.message).to eq('There was a problem saving that upvote.')
    end
  end
end
