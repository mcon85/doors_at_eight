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
    it 'admin? returns false if user is not an admin' do
      expect(user.admin?).to eq(false)
    end

    it 'admin? returns true if user is an admin' do
      user = FactoryGirl.create(:user, role: 'admin')
      expect(user.admin?).to eq(true)
    end
  end

  describe '#owner_of?' do
    Item = Struct.new(:user_id)

    it 'returns true if the user is an admin' do
      admin = FactoryGirl.create(:user, role: 'admin')
      item = Item.new('not the admin id')

      expect(admin.owner_of?(item)).to eq(true)
    end

    it 'returns true if the user is the owner of the item' do
      user = FactoryGirl.create(:user)
      item = Item.new(user.id)

      expect(user.owner_of?(item)).to eq(true)
    end

    it 'returns false if the user is not the owner of the item' do
      user = FactoryGirl.create(:user)
      item = Item.new('not the user id')

      expect(user.owner_of?(item)).to eq(false)
    end
  end
end
