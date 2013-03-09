require 'spec_helper'

module Refinery
  module Htcs
    describe WorkHour do
      describe "validations" do
        subject do
          FactoryGirl.create(:work_hour)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
