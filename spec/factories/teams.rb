FactoryGirl.define do
  factory :team do
    name Faker::Team.name
    organization nil
  end
end
