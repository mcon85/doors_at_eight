require 'rails_helper'

feature 'User deletes account', %{
  As a user
  I want to delete my account
  So that I can remove my information from the website
} do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'User deletes their account' do
    login_user(user)
    visit edit_user_registration_path(user.id)

    click_button('Cancel my account')

    expect(page).not_to have_content(user.username)
    expect(page).to have_content('Your account has been successfully
                                 cancelled.')
  end

  scenario 'Unauthenticated user' do
    visit edit_user_registration_path(user)

    expect(page).not_to have_button('Cancel my account')
  end
end
