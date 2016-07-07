require 'rails_helper'

describe User, type: :model do
  let(:username) { 'Factorial' }
  let(:user) { FactoryGirl.create(:user, username: username) }

  it { should have_valid(:email).when('user@example.com', 'foo@bar.net') }
  it { should_not have_valid(:email).when(nil, '', 'aldkjfad', '@com', '.abc') }

  it 'has a matching password confirmation for password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'notapassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

  describe 'Confirm username' do
    it 'should have a username' do
      expect(user.username).to eq(username)
    end
  end

  describe 'Confirm admin role' do
    it 'is not an admin if the role is not admin' do
      expect(user.admin?).to eq(false)
    end

    it 'is an admin if the role is admin' do
      admin_user = FactoryGirl.create(:user, role: 'admin')
      expect(admin_user.admin?).to eq(true)
    end
  end
end
