require 'rails_helper'

feature 'user can downvote a review', %{
  As a user
  I can downvote a review
  So that I can promote reviews that I like
} do
  # ACCEPTANCE CRITERIA
  # [X] User can see an downvote button
  # [X] User clicks downvote and button turns red to track vote
  # [X] User cannot downvote twice
  # [X] User must be authenticated to vote
  # [X] User can click downvote button again to cancel vote

  let(:user) { FactoryGirl.create(:user) }
  let(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue: venue) }

  before do
    login_user user
  end

  scenario 'user sees downvote button next to a review' do
    visit venue_path(venue)

    within '.review' do
      expect(page).to have_css(".fa-chevron-down")
    end
  end

  scenario 'user clicks downvote button and records vote' do
    visit venue_path(venue)

    find('.downvote-button').click

    expect(page).to have_content('Thanks for down-voting!')
    within '.downvote' do
      expect(page).to have_css('.red')
    end
  end

  scenario 'user cancels vote by clicking downvote button again' do
    visit venue_path(venue)

    find('.downvote-button').click

    find('.downvote-button').click

    expect(page).to have_content('Your vote was removed')
    within '.downvote' do
      expect(page).not_to have_css('.red')
    end
  end

  scenario 'user cannot vote if they are not authenticated' do
    logout

    visit venue_path(venue)

    expect(page).not_to have_css('.downvote-button')
  end
end
