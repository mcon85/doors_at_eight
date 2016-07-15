require 'rails_helper'

feature 'user can upvote a review', %{
  As a user
  I can upvote a review (without a page refresh)
  So that I can promote reviews that I like
}, js: true do
  # ACCEPTANCE CRITERIA
  # [X] User can see an upvote button
  # [X] User clicks upvote and button turns green to track vote
  # [X] User cannot upvote twice
  # [X] User must be authenticated to vote
  # [X] User can click upvote button again to cancel vote
  # [X] User can see the current vote count

  let(:user) { FactoryGirl.create(:user) }
  let(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue: venue) }

  before do
    login_user user
    visit venue_path(venue)
  end

  scenario 'user clicks upvote button and records vote' do
    find('#upvote-button').trigger('click')

    within('.upvote') do
      expect(page).to have_css('.green')
    end

    within('.reviews') do
      expect(page).to have_content('1')
    end
  end

  scenario 'user cancels vote by clicking upvote button again' do
    find('#upvote-button').trigger('click')
    find('#upvote-button').trigger('click')

    within('.upvote') do
      expect(page).not_to have_css('.green')
    end

    within('.reviews') do
      expect(page).to have_content('0')
    end
  end

  scenario 'user cannot vote if they are not authenticated' do
    logout

    visit venue_path(venue)

    expect(page).not_to have_css('.upvote-button')
  end

  scenario 'upvote button is not red if user clicks downvote' do
    find('#downvote-button').trigger('click')

    within('.upvote') do
      expect(page).not_to have_css('.red')
    end
  end

  scenario 'user clicks upvote after previously downvoting switches vote' do
    find('#downvote-button').trigger('click')
    find('#upvote-button').trigger('click')

    within '.upvote' do
      expect(page).to have_css('.green')
    end
    within '.downvote' do
      expect(page).not_to have_css('.red')
    end

    within('.reviews') do
      expect(page).to have_content('1')
    end
  end
end
