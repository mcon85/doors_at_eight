require 'rails_helper'

feature 'avatar' do
  scenario 'user uploads an avatar' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Username', with: 'Test User'
    fill_in 'Email', with: 'doorsat8@mailinator.com'
    fill_in 'Password', with: 'thispasswordisawful'
    fill_in 'Password confirmation', with: 'thispasswordisawful'
    attach_file :user_avatar, "#{Rails.root}/spec/support/images/sample_avatar.jpg"
    click_button 'Sign up'

    expect(page).to have_content I18n.t 'devise.registrations.signed_up'
    expect(page).to have_css("img[src*='sample_avatar.jpg']")
    save_and_open_page
  end
end
