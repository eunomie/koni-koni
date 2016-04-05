FactoryGirl.define do
  factory :organization do
    name Faker::Company.name
    teams nil
    notes nil
    users nil
    moods nil
  end
end
