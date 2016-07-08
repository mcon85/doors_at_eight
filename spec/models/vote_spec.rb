require 'rails_helper'

describe Vote, type: :model do
  it { should have_valid(:vote_type).when('up')}
  it { should have_valid(:vote_type).when('down')}
  it { should_not have_valid(:vote_type).when('whatever', nil, '')}

  it { should belong_to(:user) }
  it { should belong_to(:review) }
end
