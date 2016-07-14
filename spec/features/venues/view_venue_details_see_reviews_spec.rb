require 'rails_helper'

feature 'View details of the venue' do
  let!(:venue) { FactoryGirl.create(:venue) }
  let!(:review) { FactoryGirl.create(:review, venue_id: venue.id,
                                      body: 'I love it here the most') }

  scenario 'Sees reviews if the venue has been reviewed' do
    visit venues_path

    click_link(venue.name)

    expect(page).to have_content('5')
    expect(page).to have_content('I love it here the most of all the places')
  end
end
