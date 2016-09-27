FactoryGirl.define do
  factory :developer do
    name { Faker::Name.name }
    age { Faker::Number.between(2, 100) }

    trait :invalid do
      name { "" }
      age { Faker::Number.between(-100, -2) }
    end
  end
end
