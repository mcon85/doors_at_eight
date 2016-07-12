require 'rails_helper'

feature 'user can upvote a review', %{
  As a user
  I can upvote a review
  So that I can promote reviews that I like
} do
  # ACCEPTANCE CRITERIA
  # [X] User can see an upvote button
  # [X] User clicks upvote and button turns green to track vote
  # [X] User cannot upvote twice
  # [X] User must be authenticated to vote
  # [X] User can click upvote button again to cancel vote

  let(:user) { FactoryGirl.create(:user) }
  let(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue: venue) }

  before do
    login_user user
  end

  scenario 'user sees upvote button next to a review' do
    visit venue_path(venue)

    within '.review' do
      expect(page).to have_css(".fa-chevron-up")
    end
  end

  scenario 'user clicks upvote button and records vote' do
    visit venue_path(venue)

    find('.upvote-button').click

    expect(page).to have_content('Thanks for upvoting!')
    within '.upvote' do
      expect(page).to have_css('.green')
    end
  end

  scenario 'user cancels vote by clicking upvote button again' do
    visit venue_path(venue)

    find('.upvote-button').click

    find('.upvote-button').click

    expect(page).to have_content('Your vote was removed')
    within '.upvote' do
      expect(page).not_to have_css('.green')
    end
  end

  scenario 'user cannot vote if they are not authenticated' do
    logout

    visit venue_path(venue)

    expect(page).not_to have_css('.upvote-button')
  end
end
