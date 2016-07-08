FactoryGirl.define do
  factory :user do
    sequence(:email) { |num| "doorsat8_#{num}@mailinator.com" }
    sequence(:username) { |num| "Factorial_#{num}" }
    password 'please123'
    role 'member'
  end
end
