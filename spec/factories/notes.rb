FactoryGirl.define do
  factory :note do
    occurred_on Date.today
    body Faker::Hipster.paragraph
    organization nil
  end
end
