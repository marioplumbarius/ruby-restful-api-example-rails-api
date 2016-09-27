FactoryGirl.define do
  factory :developer do
    name { Faker::Name.name }
    age { Faker::Number.between(1, 100) }

    trait :invalid do
      name { "" }
      age { Faker::Number.between(-100, -1) }
    end
  end
end
