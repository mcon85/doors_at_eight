require 'rails_helper'

feature 'User signs out', %{
  As a user
  I want to sign out
  So that I can log out on a shared computer
}, :devise do
  scenario 'can sign out' do
    user = FactoryGirl.create(:user)
    visit root_path

    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content I18n.t 'devise.sessions.signed_in'

    click_link 'Sign Out'

    expect(page).to have_content I18n.t 'devise.sessions.signed_out'
  end
end
