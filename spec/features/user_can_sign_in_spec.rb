require 'rails_helper'

feature 'can sign in with an existing account', :devise do
  scenario 'signs in with an account' do
    new_user = FactoryGirl.create(:user)
    login_user(new_user)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end
end

feature 'authenication helper works' do
  scenario 'we try to run this helper' do
    new_user = FactoryGirl.create(:user)
    authed_user = login_user(new_user)
    expect(authed_user).to_not eq(nil)
  end
end
