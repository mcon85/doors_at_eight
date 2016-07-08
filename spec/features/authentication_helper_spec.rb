require 'rails_helper'

feature 'authenication helper works' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'we try to run this helper' do
    expect { login_user(user) }.not_to raise_error
  end
end
