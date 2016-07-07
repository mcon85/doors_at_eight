require 'rails_helper'

feature 'can sign in with an existing account', :devise do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'signs in with an account' do
    login_user(user)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end
end
