require 'faker'
FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    date_of_birth { 21.years.ago }
    email { Faker::Internet.email }
    password Faker::Internet.password
    password_confirmation { "#{password}" }
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin_user, parent: :user do
    email "admin@example.com"
  end
end
