FactoryGirl.define do
  factory :venue do
    sequence(:name) {|number| "Venue #{number}" }
    capacity 34
    website "http://www.venue.com"
    address "23 harisson ave"
    t_accessible true
  end
end
