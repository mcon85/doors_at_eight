require 'rails_helper'

feature 'Create a new review' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.attributes_for(:review) }

  before do
    visit new_venue_review_path(venue.id)
  end

  scenario 'User sees success msg and updated page after filling out form' do
    fill_in('Rating', with: review[:rating])
    fill_in('Body', with: review[:body])

    click_button('Create Rating')

    expect(page).to have_content('Review added successfully')
    expect(page).to have_content('5')
    expect(page).to have_content('this place is the shit')
  end

  scenario 'User sees error msg if non-number entered' do
    fill_in('Rating', with: 'b')

    click_button('Create Rating')

    expect(page).to have_content('Problem saving review.')
    expect(page).to have_content('Rating is not a number')
  end

  scenario 'User sees error msg if blanks entered' do
    click_button('Create Rating')

    expect(page).to have_content('Problem saving review.')
    expect(page).to have_content("Rating can't be blank")
  end

  scenario 'User sees error msg if blanks entered' do
    fill_in('Rating', with: 8)

    click_button('Create Rating')

    expect(page).to have_content('Problem saving review.')
    expect(page).to have_content("Rating must be less than or equal to 5")
  end
end
