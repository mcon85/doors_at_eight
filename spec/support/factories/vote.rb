FactoryGirl.define do
  factory :vote do
    user
    review
    vote_type 'up'
  end
end
