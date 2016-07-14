require 'rails_helper'

feature 'Create a new review' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.build(:review, body: 'this place is the shit') }

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

  scenario 'user submits review without rating' do
    fill_in('Body', with: review[:body])

    click_button('Save Review')

    expect(page).to have_content('Problem saving review')
    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content('Rating is not a number')
    expect(review.persisted?).to eq(false)
  end
end
