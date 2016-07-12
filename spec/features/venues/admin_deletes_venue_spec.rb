require 'rails_helper'

feature 'Admin deletes a venue' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:t_is_accessible_string) { 'T is nearby' }

  scenario 'Admin user deletes venue successfully' do
    visit venue_path(venue)

    click_button('Delete')

    expect(page).not_to have_content(venue['name'])
    expect(page).to have_content('Venue deleted successfully')
  end
end
