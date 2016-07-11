FactoryGirl.define do
  factory :review do
    rating 5
    body 'this place is the shit'
    user
    venue
  end
end
