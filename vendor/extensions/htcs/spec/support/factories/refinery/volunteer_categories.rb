
FactoryGirl.define do
  factory :volunteer_category, :class => Refinery::VolunteerCategories::VolunteerCategory do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

