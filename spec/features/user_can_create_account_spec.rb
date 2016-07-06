require 'rails_helper'

feature 'User can create new account' do
  scenario 'visits sign up page' do
    visit '/users/sign_up'
    expect(page).to have_content 'Sign up'
  end

  scenario 'creates an account' do
    visit '/users/sign_up'

    fill_in 'Email', with: 'doorsat8@mailinator.com'
    fill_in 'Password', with: 'abc12345'
    fill_in 'Password confirmation', with: 'abc12345'
    click_button 'Sign up'

    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
  end
end
