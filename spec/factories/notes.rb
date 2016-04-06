FactoryGirl.define do
  factory :note do
    occurred_on Time.zone.today
    body Faker::Hipster.paragraph
    organization nil
  end
end
