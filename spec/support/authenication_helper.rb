module AuthenticationHelper
  def login_user
    user = FactoryGirl.create(:user)
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    return user
  end
end
