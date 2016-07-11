require 'rails_helper'

feature 'Edit a review' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:user) { FactoryGirl.create(:user) }
  let(:review) { FactoryGirl.create(:review) }

  before do
    visit new_venue_review_path(venue.id)
  end

  scenario 'User edits a review' do
    visit edit_venue_review_path(venue, review)

    select('3', from: 'Rating')
    fill_in('Body', with: 'This review has been edited')
    click_button('Save Review')

    expect(page).to have_content('3')
    expect(page).to have_content('This review has been edited')
  end

  scenario 'User sees error msg if blanks entered' do
    click_button('Save Review')

    expect(page).to have_content('Problem saving review.')
    expect(page).to have_content("Rating can't be blank")
  end
end
