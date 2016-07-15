require 'rails_helper'

feature 'User can sign in with existing account', %{
  As a user
  I want to sign in using my exisiting credentials
  So that I can be authenticated and use more features of the site
} do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'signs in with an account' do
    login_user(user)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end
end
