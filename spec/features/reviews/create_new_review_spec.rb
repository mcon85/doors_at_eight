require 'rails_helper'

feature 'Create new review', %{
  As a user
  I want to leave a new review
  So that I can share my thoughts about a venue
} do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.build(:review, body: 'this place is the shit') }

  before do
    login_user(user)
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

  scenario 'an unauthenticated user cannot create a new review' do
    logout

    visit new_venue_review_path(venue.id)

    expect(page).to have_content('You need to sign in or sign up before '\
                                 'continuing')
    expect(current_path).to eq(new_user_session_path)
  end
end
