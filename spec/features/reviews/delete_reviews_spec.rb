require 'rails_helper'

feature 'Delete a review' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue: venue) }

  before do
    login_user(user)
    visit venue_path(venue)
  end

  scenario 'User deletes review' do
    within('.reviews') do
      click_button('Delete')
    end

    expect(page).not_to have_content(review.body)
    expect(page).to have_content('Review deleted successfully')
  end
end
