FactoryGirl.define do
  factory :user do
    name "Test Name"
    sequence(:email) { |n| "email#{n}@test.com" }
    password 'password'
    password_confirmation 'password'
    admin false
  end

  trait :admin_user do
    admin true
  end
  
end
