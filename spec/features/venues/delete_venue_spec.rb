require 'rails_helper'

feature 'Update a venue' do
  let(:user) { FactoryGirl.create(:user) }
  let(:venue) { FactoryGirl.create(:venue, user: user) }
  let(:t_is_accessible_string) { 'T is nearby' }

  before do
    login_user(user)
    visit venue_path(venue)
  end

  scenario 'User deletes venue' do
    click_button('Delete')

    expect(page).not_to have_content(venue['name'])
    expect(page).to have_content('Venue deleted successfully')
  end
end
