require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:email).when('user@example.com', 'foo@bar.net') }
  it { should_not have_valid(:email).when(nil, '', 'aldkjfad', '@com', '.abc') }

  it 'has a matching password confirmation for password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'notapassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end

RSpec.describe 'Confirm username' do
  it 'should have a username' do
    user = FactoryGirl.create(:user)
    expect(user.username).to eq('Factorial')
  end
end

RSpec.describe 'Confirm admin role' do
  it 'admin? returns false if user is not an admin' do
    user = FactoryGirl.create(:user)
    expect(user.admin?).to eq(false)
  end

  it 'admin? returns true if user is an admin' do
    user = FactoryGirl.create(:user, role: 'admin')
    expect(user.admin?).to eq(true)
  end
end
