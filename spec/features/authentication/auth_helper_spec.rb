require 'rails_helper'

feature 'authenication helper works' do
  scenario 'we try to run this helper' do
    user = login_user
    expect(user).to_not eq(nil)
  end
end
