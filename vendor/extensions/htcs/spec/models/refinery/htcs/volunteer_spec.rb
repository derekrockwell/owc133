require 'spec_helper'

module Refinery
  module Htcs
    describe Volunteer do
      let(:valid_attributes) { { :first_name => "Vinnie", :last_name => "Volunteer", :email => 'vinnie@example.com', :zip => '55419' } }
      
      describe "validations" do
        subject do
          FactoryGirl.create(:volunteer, valid_attributes)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        
        it "should require a first name" do
          FactoryGirl.build(:volunteer, valid_attributes.merge(:first_name => '')).should_not be_valid
        end

        it "should require a last name" do
          FactoryGirl.build(:volunteer, valid_attributes.merge(:last_name => '')).should_not be_valid
        end

        it "should require a unique email" do
          FactoryGirl.build(:volunteer, valid_attributes.merge(:email => '')).should_not be_valid
          volunteer1 = FactoryGirl.create(:volunteer, valid_attributes)
          FactoryGirl.build(:volunteer, valid_attributes).should_not be_valid
        end

        it "should require a zip code" do
          FactoryGirl.build(:volunteer, valid_attributes.merge(:zip => '')).should_not be_valid
        end
      end

      describe "initial registration" do
        it "should be able to specify multiple volunteering interest categories"
      end

      describe "work hour entries" do
      end

      describe "confirmation workflow" do
        it "should initialize to status 'pending' when first created" do
          volunteer = FactoryGirl.create(:volunteer, valid_attributes)
          volunteer.status.should == "pending"
        end

        it "should not be able to set the status via mass assignment" do
          FactoryGirl.build(:volunteer, valid_attributes.merge(:status => 'active'))
        end

        it "should be able to be promoted to 'active'" do
          volunteer = FactoryGirl.create(:volunteer, valid_attributes)
          expect {
            volunteer.promote!.should be_true
          }.to change(volunteer, :status).from('pending').to('active')
        end

        it "should send an invitation email when promoted to 'active'"

        it "should be able to disable an 'active' volunteer" do
          volunteer = FactoryGirl.create(:volunteer, valid_attributes)
          volunteer.promote!
          volunteer.reload
          expect {
            volunteer.disable!
          }.to change(volunteer, :status).from('active').to('disabled')
        end

        context "When the user is activated" do

          it "should set its password to changeme" do
             volunteer = FactoryGirl.create(:volunteer, valid_attributes)
            expect {
              volunteer.promote!
            }.to change(volunteer, :encrypted_password)
          end

        end
      end
    end
  end
end
