
FactoryGirl.define do
  factory :htc, :class => Refinery::Htcs::Htc do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

