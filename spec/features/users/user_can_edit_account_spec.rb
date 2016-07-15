require 'rails_helper'

feature 'User makes changes to account', %{
  As a user
  I want to edit my account information
  So that I can make updates to my account if my information changes
}, :devise do
  scenario 'can change username' do
    user = FactoryGirl.create(:user)
    visit root_path
    login_user(user)
    click_link user.username
    fill_in 'Username', with: 'awesomesauce'
    fill_in 'Current password', with: user.password
    click_button 'Update Account'

    expect(page).to have_content I18n.t 'devise.registrations.updated'
    expect(page).to have_content 'awesomesauce'
  end

  scenario 'can not enter username that is already taken' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    visit root_path
    login_user(user1)
    click_link user1.username
    fill_in 'Username', with: user2.username
    fill_in 'Current password', with: user1.password
    click_button 'Update Account'

    expect(page).to have_content 'Username has already been taken'
  end

  scenario 'can change email' do
    user = FactoryGirl.create(:user)
    visit root_path
    login_user(user)
    click_link user.username
    fill_in 'Email', with: 'newemail@test.com'
    fill_in 'Current password', with: user.password
    click_button 'Update Account'

    expect(page).to have_content I18n.t 'devise.registrations.updated'
    click_link user.username
    expect(page).to have_field('Email', with:  'newemail@test.com')
  end

  scenario 'can not enter email that is already taken' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    visit root_path
    login_user(user1)
    click_link user1.username
    fill_in 'Email', with: user2.email
    fill_in 'Current password', with: user1.password
    click_button 'Update Account'

    expect(page).to have_content 'Email has already been taken'
  end
end
