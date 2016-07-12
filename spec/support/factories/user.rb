FactoryGirl.define do
  factory :user do
    sequence(:username) { |number| "User_#{number}" }
    sequence(:email) { |number| "Email_#{number}@mailinator.com" }
    password 'password'
    avatar File.open("#{Rails.root}/spec/support/images/sample_avatar.jpg")
    role 'member'
    factory :admin do
      role 'admin'
    end
  end
end
