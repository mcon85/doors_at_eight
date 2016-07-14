require 'rails_helper'

feature 'Venue searching' do
  let(:venue) { FactoryGirl.create(:venue) }

  scenario 'user searches by venue name that exists' do
    visit root_path

    fill_in('Search', with: venue.name)
    click_button('Search')

    expect(page).to have_content(venue.name)
  end

  scenario 'user searches by address that exists' do
    visit root_path

    fill_in('Search', with: venue.address)
    click_button('Search')

    expect(page).to have_content(venue.name)
  end

  scenario 'user searches on an empty string, sees all venues' do
    venue_two = FactoryGirl.create(:venue)
    venue_three = FactoryGirl.create(:venue)
    venues = [venue, venue_two, venue_three]

    visit root_path

    fill_in('Search', with: '')
    click_button('Search')

    venues.each do |checked_venue|
      expect(page).to have_content(checked_venue.name)
    end
  end

  scenario "searches for a venue that doesn't exist" do
    visit root_path

    fill_in('Search', with: 'does not exist')
    click_button('Search')

    expect(page).not_to have_content(venue.name)
  end
end
