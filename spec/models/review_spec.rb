require 'rails_helper'

describe Review, type: :model do
  it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
  it { should_not have_valid(:rating).when(0, 6, 10, 'abd', 'a', '', nil) }

  it { should belong_to(:user) }

  it { should belong_to(:venue) }

  it { should have_many(:votes).dependent(:destroy) }

  let(:review) { FactoryGirl.create(:review) }

  describe '#short_body' do
    it 'should return the whole body if it is less than max' do
      expect(review.short_body).to eq(review.body)
    end

    it 'should truncate the body text if it is more than max' do
      long_body = 'This body is well over the maximum allowed in a tweet '\
                  'so we need to make it much much shorter so that everything '\
                  'can fit in a 140 character tweet.'
      review.body = long_body

      expect(review.short_body).to eq('This body is well over the maximum '\
                                      'allowed in a tweet so we need to make '\
                                      'it much...')
    end
  end

  describe '#vote_count' do
    it 'should return 0 if there are no votes' do
      expect(review.vote_count).to eq(0)
    end

    it 'should return 2 if there are two upvotes' do
      FactoryGirl.create_list(:vote, 2, review: review, vote_type: 'up')

      expect(review.vote_count).to eq(2)
    end

    it 'should return -1 if there is a downvote' do
      FactoryGirl.create(:vote, review: review, vote_type: 'down')

      expect(review.vote_count).to eq(-1)
    end

    it 'should tally the total up and down votes' do
      FactoryGirl.create_list(:vote, 3, review: review, vote_type: 'up')
      FactoryGirl.create_list(:vote, 2, review: review, vote_type: 'down')
    end
  end
end
