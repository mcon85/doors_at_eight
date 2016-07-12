require 'rails_helper'

feature 'Admin views all venues' do
  scenario 'When admin visits page sees all users.' do
    users = FactoryGirl.create_list(:user, 3)
    admin = FactoryGirl.create(:user, role: "admin")

    login_user(admin)
    visit admin_users_path(admin.id)

    users.each do |user|
      expect(page).to have_content(user.username)
      expect(page).to have_content(admin.username)
    end
  end
end
