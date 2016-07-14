require 'rails_helper'

feature 'Edit a review' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review, venue: venue) }

  before do
    login_user(user)
    visit edit_venue_review_path(venue, review)
  end

  scenario 'User edits a review' do
    select('3', from: 'Rating')
    fill_in('Body', with: 'This review has been edited')
    click_button('Save Review')

    within('.review .rating') do
      expect(page).to have_content '3'
    end

    expect(page).to have_content('This review has been edited')

    updated_review = Review.find(review.id)
    expect(updated_review.body).to eq('This review has been edited')
  end
end
