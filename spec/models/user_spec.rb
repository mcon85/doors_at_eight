require 'rails_helper'

describe User, type: :model do
  let(:username) { 'Factorial' }
  let(:user) { FactoryGirl.create(:user, username: username) }

  it { should have_many(:venues) }

  it { should have_valid(:email).when('user@example.com', 'foo@bar.net') }
  it { should_not have_valid(:email).when(nil, '', 'aldkjfad', '@com', '.abc') }

  it { should have_many(:reviews).dependent(:destroy) }
  it { should have_many(:votes).dependent(:destroy) }

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

  describe '#admin?' do
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

  describe '#check_vote_status_of' do
    let(:user) { FactoryGirl.create(:user) }

    it 'returns a string if the user has voted on the review' do
      vote = FactoryGirl.create(:vote, user: user)

      expect(user.check_vote_status_of(vote.review)).to be_a(String)
    end

    it 'returns nil if the user has not voted on the review' do
      review = FactoryGirl.create(:review)

      expect(user.check_vote_status_of(review)).to be(nil)
    end

    it 'returns "up" if the user has upvoted the review' do
      vote = FactoryGirl.create(:vote, user: user, vote_type: 'up')

      expect(user.check_vote_status_of(vote.review)).to eq('up')
    end

    it 'returns "down" if the user has downvoted the review' do
      vote = FactoryGirl.create(:vote, user: user, vote_type: 'down')

      expect(user.check_vote_status_of(vote.review)).to eq('down')
    end
  end
end
