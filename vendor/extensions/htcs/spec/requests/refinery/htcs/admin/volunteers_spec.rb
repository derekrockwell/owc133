# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Htcs" do
    describe "Admin" do
      describe "volunteers" do
        login_refinery_user

        describe "volunteers list" do
          before do
            FactoryGirl.create(:volunteer, :first_name => "Vinnie", :last_name => "Volunteer", :zip => '12345', :email => 'vinnie@example.com')
            FactoryGirl.create(:volunteer, :first_name => "Vanna", :last_name => "Volunteer", :zip => '12345', :email => 'vanna@example.com')
          end

          it "shows two items" do
            visit refinery.htcs_admin_volunteers_path
            page.should have_content("Vinnie")
            page.should have_content("Vanna")
          end
        end

        describe "create" do
          before do
            visit refinery.htcs_admin_volunteers_path

            click_link "Add New Volunteer"
          end

          context "valid data" do
            it "should succeed" do
              pending "laters"
              fill_in "First Name", :with => "Vinnie"
              fill_in "Last Name", :with => "Volunteer"
              fill_in "Zip", :with => "12345"
              fill_in "Email", :with => "Vinnie@example.com"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Htcs::Volunteer.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("First Name can't be blank")
              Refinery::Htcs::Volunteer.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:volunteer, :first_name => "UniqueTitle", :last_name => "Volunteer", :email => 'vinnie@example.com', :zip => '12345') }

            it "should fail" do
              visit refinery.htcs_admin_volunteers_path

              click_link "Add New Volunteer"

              fill_in "First Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Htcs::Volunteer.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:volunteer, :first_name => "A first_name", :last_name => "Volunteer", :email => 'vinnie@example.com', :zip => '12345') }

          it "should succeed" do
            visit refinery.htcs_admin_volunteers_path

            within ".actions" do
              click_link "Edit this volunteer"
            end

            fill_in "First Name", :with => "A different first_name"
            click_button "Save"

            page.should have_content("'A different first_name' was successfully updated.")
            page.should have_no_content("A first_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:volunteer, :first_name => "Vinnie", :last_name => "Volunteer", :email => 'vinnie@example.com', :zip => '12345') }

          it "should succeed" do
            visit refinery.htcs_admin_volunteers_path

            click_link "Remove this volunteer forever"

            page.should have_content("'Vinnie' was successfully removed.")
            Refinery::Htcs::Volunteer.count.should == 0
          end
        end

      end
    end
  end
end
