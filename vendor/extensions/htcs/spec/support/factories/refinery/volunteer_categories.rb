
FactoryGirl.define do
  factory :volunteer_category, :class => Refinery::Htcs::VolunteerCategory do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

