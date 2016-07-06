require 'rails_helper'

feature 'can sign in with an existing account', :devise do
  scenario 'signs in with an account' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end
end
