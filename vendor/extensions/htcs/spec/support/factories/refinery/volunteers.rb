
FactoryGirl.define do
  factory :volunteer, :class => Refinery::Htcs::Volunteer do
    sequence(:first_name) { |n| "refinery#{n}" }
    password '123456'
    password_confirmation '123456'
  end
end

