
FactoryGirl.define do
  factory :volunteer, :class => Refinery::Htcs::Volunteer do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

