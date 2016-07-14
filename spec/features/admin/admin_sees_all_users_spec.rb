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

  scenario 'Non-admin is rejected from viewing user index' do
    users = FactoryGirl.create_list(:user, 3)
    member = FactoryGirl.create(:user)

    login_user(member)


    expect{ visit admin_users_path(member.id) }
    .to raise_error(ActionController::RoutingError)
  end
end
