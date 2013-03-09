require 'spec_helper'

module Refinery
  module Htcs
    describe WorkHour do
      describe "validations" do
        let(:volunteer) { Volunteer.create!(:first_name => "Vinnie", :last_name => "Volunteer", :zip => '12345', :email => 'vinnie@example.com') }
        let(:patient_category) { VolunteerCategory.find_or_create_by_name("Patient & Family Care")}
        let(:work_hour_attributes) { { :volunteer_id => volunteer.id, :volunteer_category => patient_category, :activity_date => Date.today.strftime('%Y-%m-%d'), :hours => 2 } }
        subject { WorkHour.new(work_hour_attributes) }

        it "should be valid with default attributes" do
          subject.should be_valid
        end

        it "should require a volunteer (volunteer_id)" do
          WorkHour.new(work_hour_attributes.except(:volunteer_id)).should_not be_valid
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
end
