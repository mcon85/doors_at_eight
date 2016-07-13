require 'rails_helper'

feature 'users cannot edit venues they did not create', %{
  As a user
  I can't edit other users' venues
  So that I don't mess up other users's submission
} do
  # ACCEPTANCE CRITERIA
  # [X] User cannot edit another user's venue
  # [X] User cannot delete another user's venue

  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }
  let(:venue) { FactoryGirl.create(:venue, user: another_user) }

  before do
    login_user(user)
    visit venue_path(venue)
  end

  scenario 'user tries to edit a venue of another user' do
    expect(page).not_to have_button('Edit')
  end

  scenario 'user tries to visit the edit page for another user venue' do
    visit edit_venue_path(venue)

    expect(page).to have_content('You do not have permission to complete '\
                                 'that action.')
    expect(current_path).to eq(root_path)
    expect(page).not_to have_css('form')
  end

  scenario 'user tries to delete venue of another user' do
    expect(page).not_to have_button('Delete')
  end
end
