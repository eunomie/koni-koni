FactoryGirl.define do
  factory :mood do
    felt_on Time.zone.today
    organization nil
  end
end
