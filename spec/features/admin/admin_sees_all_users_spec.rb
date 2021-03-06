require 'rails_helper'

feature 'Admin views all users', %{
  As an administrator
  I want to view users
  So that I can see who is using the site
} do
  scenario 'When admin visits page sees all users.' do
    users = FactoryGirl.create_list(:user, 3)
    admin = FactoryGirl.create(:user, role: "admin")

    login_user(admin)
    visit root_path
    click_link 'Admin Section'

    users.each do |user|
      expect(page).to have_content(user.username)
      expect(page).to have_content(admin.username)
    end
  end

  scenario 'Non-admin is rejected from viewing user index' do
    member = FactoryGirl.create(:user)

    login_user(member)

    expect { visit admin_users_path(member.id) }.
      to raise_error(ActionController::RoutingError)
  end
end
