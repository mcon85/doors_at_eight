require 'rails_helper'

feature 'avatar' do
  let(:user) { FactoryGirl.build(:user) }

  scenario 'user uploads an avatar' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    attach_file :user_avatar, user.avatar

    click_button 'Sign up'

    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
    expect(page).to have_css("img[src*='sample_avatar.jpg']")
  end
end
