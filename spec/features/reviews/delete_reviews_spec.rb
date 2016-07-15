require 'rails_helper'

feature 'Delete a review', %{
  As a user
  I want to delete my own review
  So that I can remove my thoughts about a venue
} do
  let(:user) { FactoryGirl.create(:user) }
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue: venue, user: user) }

  scenario 'User deletes review' do
    login_user(user)
    visit venue_path(venue)

    within('.reviews') do
      click_button('Delete')
    end

    expect(page).not_to have_content(review.body)
    expect(page).to have_content('Review deleted successfully')
  end

  scenario 'Unauthenticated user' do
    visit venue_path(venue)

    within('.reviews') do
      expect(page).not_to have_button('Delete')
    end
  end
end
