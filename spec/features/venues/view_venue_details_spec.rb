require 'rails_helper'

feature 'View details of the venue' do
  scenario 'When a user clicks on the venue name see venue details.' do
    venue = FactoryGirl.create(:venue)

    visit venues_path

    click_link(venue.name)

    expect(page).to have_content(venue.name)
  end
end
