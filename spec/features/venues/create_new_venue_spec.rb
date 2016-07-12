require 'rails_helper'

feature 'Create a venue' do
  let(:user) { FactoryGirl.create(:user) }
  let(:venue) { FactoryGirl.build(:venue) }
  let(:t_is_accessible_string) { 'T is nearby' }

  before do
    login_user(user)
    visit new_venue_path
  end

  scenario 'User fills out form correctly' do
    fill_in('Name', with: venue['name'])
    fill_in('Capacity', with: venue['capacity'])
    fill_in('Website', with: venue['website'])
    fill_in('Address', with: venue['address'])
    choose('t_accessible')

    click_button('Save Venue')

    expect(page).to have_content(venue['name'])
    expect(page).to have_content(venue['capacity'])
    expect(page).to have_content(venue['website'])
    expect(page).to have_content(venue['address'])
    expect(page).to have_content(t_is_accessible_string)

    expect(page).to have_content('Venue saved successfully')
  end

  scenario 'User submits blank form' do
    click_button('Save Venue')

    expect(page).to have_content('Problems saving venue')
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Address can't be blank")
  end
end
