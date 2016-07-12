FactoryGirl.define do
  factory :review do
    rating 5
    sequence(:body) { |number| "This place deserves #{number} stars" }
    user
    venue
  end
end
