require 'rails_helper'

feature 'Create a venue' do
  feature 'Update a venue' do
  let(:venue) { FactoryGirl.create(:venue) }
  let(:t_is_accessible_string) { 'T is nearby' }

  before do
    visit venue_path(venue)
  end

  scenario 'User deletes venue' do

    click_button('Delete')

    expect(page).not_to have_content(venue['name'])
    expect(page).to have_content('Venue deleted successfully')
  end
  end
end
