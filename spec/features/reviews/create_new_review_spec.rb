require 'rails_helper'

feature 'Create a new review' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    visit new_venue_review_path(venue.id)
  end

  scenario 'User fills out review form correctly' do
    fill_in('Rating', with: 5)
    fill_in('Body', with: 'this place is the shit')

    click_button('Create Rating')

    expect(page).to have_content('Review added successfully')
    expect(page).to have_content('5')
    expect(page).to have_content('this place is the shit')
  end

end
