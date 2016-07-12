require 'rails_helper'

feature 'Create a new review' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.attributes_for(:review) }

  before do
    visit new_venue_review_path(venue.id)
  end

  scenario 'User sees success msg and updated page after filling out form' do
    select(review[:rating], from: 'Rating')
    fill_in('Body', with: review[:body])

    click_button('Save Review')

    expect(page).to have_content('Review added successfully')
    expect(page).to have_content('5')
    expect(page).to have_content('this place is the shit')
  end
end
