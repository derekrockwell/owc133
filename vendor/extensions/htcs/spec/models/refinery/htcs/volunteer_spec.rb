require 'spec_helper'

module Refinery
  module Htcs
    describe Volunteer do
      describe "validations" do
        let(:valid_attributes) { { :first_name => "Vinnie", :last_name => "Volunteer", :email => 'vinnie@example.com', :zip_code => '55419' } }
        subject do
          FactoryGirl.create(:volunteer, valid_attributes)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:first_name) { should == "Refinery CMS" }
        
        it "should require a first name" do
          Volunteer.new(valid_attributes.except(:first_name)).should_not be_valid
        end

        it "should require a last name" do
          Volunteer.new(valid_attributes.except(:last_name)).should_not be_valid
        end

        it "should require a unique email" do
          Volunteer.new(valid_attributes.except(:email)).should_not be_valid
          volunteer1 = Volunteer.create!(valid_attributes)
          Volunteer.new(valid_attributes).should_not be_valid
        end

        it "should require a zip code" do
          Volunteer.new(valid_attributes.except(:zip_code)).should_not be_valid
        end
      end
    end

    describe "initial registration" do
      it "should be able to specify multiple volunteering interest categories"
    end

    describe "work hour entries" do
    end
  end
end
