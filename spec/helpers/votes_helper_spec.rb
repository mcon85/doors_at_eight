require 'rails_helper'

describe VotesHelper do
  describe '#vote_button_class' do
    let(:user) { FactoryGirl.create(:user) }
    let(:review) { FactoryGirl.create(:review) }

    it "should return 'upvote-button' for upvote button not yet clicked" do
      actual_class_string = vote_button_class(user, review, 'up')

      expect(actual_class_string).to eq('upvote-button')
    end

    it "should return 'downvote-button' for downvote button not yet clicked" do
      actual_class_string = vote_button_class(user, review, 'down')

      expect(actual_class_string).to eq('downvote-button')
    end

    it "should add 'green' to upvote if user upvoted" do
      FactoryGirl.create(:vote,
                         user: user,
                         review: review,
                         vote_type: 'up')
      actual_class_string = vote_button_class(user, review, 'up')

      expect(actual_class_string).to eq('upvote-button green')
    end

    it "should add 'red' to downvote if a user downvoted" do
      FactoryGirl.create(:vote,
                         user: user,
                         review: review,
                         vote_type: 'down')
      actual_class_string = vote_button_class(user, review, 'down')

      expect(actual_class_string).to eq('downvote-button red')
    end
  end
end
