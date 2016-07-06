require 'rails_helper'

class PostsTests < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

feature 'can sign out of an account', :devise do
  scenario 'can sign out' do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
    click_link 'Sign out'
    expect(page).to have_content I18n.t 'devise.sessions.signed_out'
  end
end
