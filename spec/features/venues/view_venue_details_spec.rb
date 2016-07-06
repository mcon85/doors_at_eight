require 'rails_helper'

feature 'View details of the venue' do
  let!(:venue) { FactoryGirl.create(:venue) }

  scenario 'When a user clicks on the venue name see venue details.' do
    visit venues_path

    click_link(venue.name)

    expect(page).to have_content(venue.name)
    expect(page).to have_content(venue.address)
    expect(page).to have_content(venue.capacity)
  end

  scenario 'When user visits venue show page should see venue details' do
    visit venue_path(venue)

    expect(page).to have_content(venue.name)
    expect(page).to have_content(venue.website)
    expect(page).to have_content(venue.address)
    expect(page).to have_content(venue.capacity)
  end
end
