require 'rails_helper'

feature 'View venue details', %{
  As a user
  I want to view details about a venue
  So that I can get more information about a venue
} do
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

  scenario 'If T accessible, user should see message: T is nearby' do
    venue = FactoryGirl.create(:venue, t_accessible: true)

    visit venue_path(venue)

    expect(page).to have_css('.fa-train')
  end

  scenario 'If T not accessible, user should not see message: T is nearby' do
    venue = FactoryGirl.create(:venue, t_accessible: false)

    visit venue_path(venue)

    expect(page).not_to have_css('.fa-train')
  end
end
