require 'rails_helper'

feature 'user can upvote a review', %{
  As a user
  I can upvote a review
  So that I can promote reviews that I like
} do
  # ACCEPTANCE CRITERIA
  # [ ] User can see an upvote button
  # [ ] User clicks upvote and button turns green to track vote
  # [ ] User cannot upvote twice
  # [ ] User must be authenticated to vote
  # [ ] User can click upvote button again to cancel vote

  let(:user) { FactoryGirl.create(:user) }
  let(:venue) { FactoryGirl.create(:venue) }
  let(:review) { FactoryGirl.create(:review, venue: venue) }

  scenario 'user sees upvote button next to a review' do
    visit venue_path(venue)

    within '.review' do
      expect(page).to have_css(".fa-chevron-up")
    end
  end
end
