require 'rails_helper'

describe Review, type: :model do
  it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
  it { should_not have_valid(:rating).when(0, 6, 10, 'abd', 'a', '', nil) }

  it { should belong_to(:user) }

  it { should belong_to(:venue) }

  it { should have_many(:votes).dependent(:destroy) }
end
