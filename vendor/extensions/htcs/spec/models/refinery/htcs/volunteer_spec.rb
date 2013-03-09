require 'spec_helper'

module Refinery
  module Htcs
    describe Volunteer do
      describe "validations" do
        subject do
          FactoryGirl.create(:volunteer,
          :first_name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:first_name) { should == "Refinery CMS" }
        
      end
    end

    describe "work hour entries" do
    end
  end
end
