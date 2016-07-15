require 'rails_helper'

describe Review, type: :model do
  it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
  it { should_not have_valid(:rating).when(0, 6, 10, 'abd', 'a', '', nil) }

  it { should belong_to(:user) }

  it { should belong_to(:venue) }

  it { should have_many(:votes).dependent(:destroy) }

  describe '#vote_count' do
    let(:review) { FactoryGirl.create(:review) }

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
