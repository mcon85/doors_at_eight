require 'rails_helper'

feature "Create a venue" do
  let(:venue) { FactoryGirl.build(:venue) }
  let(:t_is_accessible_string) { 'T is nearby' }

  scenario "User fills out form correctly" do
    visit new_venue_path

    fill_in('Name', with: venue['name'])
    fill_in('Capacity',with: venue['capacity'])
    fill_in('Website',with: venue['website'])
    fill_in('Address',with: venue['address'])
    choose('t_accessible')

    click_button('Create Venue')

    expect(page).to have_content(venue['name'])
    expect(page).to have_content(venue['capacity'])
    expect(page).to have_content(venue['website'])
    expect(page).to have_content(venue['address'])
    expect(page).to have_content(t_is_accessible_string)

    expect(page).to have_content('Venue saved successfully')
  end
end
