require 'rails_helper'

feature 'user can downvote a review with react component', %{
  As a user
  I can downvote a review (without a page refresh)
  So that I can promote reviews that I like
}, js: true do
  # ACCEPTANCE CRITERIA
  # [X] User can see an downvote button
  # [X] User clicks downvote and button turns red to track vote
  # [X] User cannot downvote twice
  # [X] User must be authenticated to vote
  # [X] User can click downvote button again to cancel vote
  # [X] User can swith votes
  # [X] User can see the current vote count

  let(:user) { FactoryGirl.create(:user) }
  let(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue: venue) }

  before do
    login_user user
    visit venue_path(venue)
  end

  scenario 'user clicks downvote button and records vote' do
    find('#downvote-button').trigger('click')

    within '.downvote' do
      expect(page).to have_css('.red')
    end

    within('.reviews') do
      expect(page).to have_content('-1')
    end
  end

  scenario 'user cancels vote by clicking downvote button again' do
    find('#downvote-button').trigger('click')

    find('#downvote-button').trigger('click')

    within '.downvote' do
      expect(page).not_to have_css('.red')
    end

    within('.reviews') do
      expect(page).to have_content('0')
    end
  end

  scenario 'user cannot vote if they are not authenticated' do
    logout
    visit venue_path(venue)

    expect(page).not_to have_css('.downvote-button')
  end

  scenario 'downvote button is not green if user clicks upvote' do
    find('#upvote-button').trigger('click')

    within('.downvote') do
      expect(page).not_to have_css('.green')
    end
  end

  scenario 'user clicks downvote after previously upvoting switches vote' do
    find('#upvote-button').trigger('click')
    find('#downvote-button').trigger('click')

    within '.downvote' do
      expect(page).to have_css('.red')
    end
    within '.upvote' do
      expect(page).not_to have_css('.green')
    end

    within('.reviews') do
      expect(page).to have_content('-1')
    end
  end
end
