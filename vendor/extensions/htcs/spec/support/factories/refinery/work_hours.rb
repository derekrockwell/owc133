FactoryGirl.define do
  factory :work_hour, :class => Refinery::Htcs::WorkHour do
    association :volunteer, :factory => :volunteer
    association :volunteer_category, :factory => :volunteer_category
    activity_date { Date.today }
    hours 2
    miles 30
  end
end

