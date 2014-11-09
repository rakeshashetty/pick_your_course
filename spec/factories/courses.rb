FactoryGirl.define do
  factory :program do
    name { Faker::Lorem.sentence }
    parent_id nil
    type "Program"
  end

end
