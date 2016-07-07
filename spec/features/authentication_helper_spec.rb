require 'rails_helper'

feature 'authenication helper works' do
  let(:user) { FactoryGirl.create(:user) }
  
  scenario 'we try to run this helper' do
    authed_user = login_user(user)
    expect(authed_user).to_not eq(nil)
  end
end
