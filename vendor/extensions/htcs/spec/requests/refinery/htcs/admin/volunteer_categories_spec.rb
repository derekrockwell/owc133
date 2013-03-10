# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Htcs" do
    describe "Admin" do
      describe "volunteer_categories" do
        login_refinery_user

        describe "volunteer_categories list" do
          before do
            FactoryGirl.create(:volunteer_category, :name => "UniqueTitleOne")
            FactoryGirl.create(:volunteer_category, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.htcs_admin_volunteer_categories_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.htcs_admin_volunteer_categories_path

            click_link "Add New Volunteer Category"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Htcs::VolunteerCategory.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Htcs::VolunteerCategory.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:volunteer_category, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.htcs_admin_volunteer_categories_path

              click_link "Add New Volunteer Category"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Htcs::VolunteerCategory.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:volunteer_category, :name => "A name") }

          it "should succeed" do
            visit refinery.htcs_admin_volunteer_categories_path

            within ".actions" do
              click_link "Edit this volunteer category"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:volunteer_category, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.htcs_admin_volunteer_categories_path

            click_link "Remove this volunteer category forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Htcs::VolunteerCategory.count.should == 0
          end
        end

      end
    end
  end
end
