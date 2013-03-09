require 'spec_helper'

module Refinery
  module WorkHours
		describe WorkHour do
			let(:user) {  }
			let(:patient_category) { Refinery::VolunteerCategories::VolunteerCategory.find_or_create_by_name("Patient & Family Care")}
			let(:work_hour_attributes) { { :user_id => 1, :volunteer_category => patient_category, :activity_date => Date.today.strftime('%Y-%m-%d'), :hours => 2 } }
			let(:work_hour) { WorkHour.new(work_hour_attributes) }

			it "should be valid with default attributes" do
				work_hour.should be_valid
			end

			it "should require a volunteer (user_id)" do
				WorkHour.new(work_hour_attributes.except(:user_id)).should_not be_valid
			end

			it "should require a category (volunteer_category)" do
				WorkHour.new(work_hour_attributes.except(:volunteer_category)).should_not be_valid
			end

			it "should require a date (activity_date)" do
				WorkHour.new(work_hour_attributes.except(:activity_date)).should_not be_valid
			end

			it "should require hours logged (hours)" do
				WorkHour.new(work_hour_attributes.except(:hours)).should_not be_valid
			end

		end
	end
end