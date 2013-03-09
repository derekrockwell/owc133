# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Htcs" do
    describe "Admin" do
      describe "htcs" do
        login_refinery_user

        describe "htcs list" do
          before do
            FactoryGirl.create(:htc, :name => "UniqueTitleOne")
            FactoryGirl.create(:htc, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.htcs_admin_htcs_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.htcs_admin_htcs_path

            click_link "Add New Htc"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Htcs::Htc.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Htcs::Htc.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:htc, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.htcs_admin_htcs_path

              click_link "Add New Htc"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Htcs::Htc.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:htc, :name => "A name") }

          it "should succeed" do
            visit refinery.htcs_admin_htcs_path

            within ".actions" do
              click_link "Edit this htc"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:htc, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.htcs_admin_htcs_path

            click_link "Remove this htc forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Htcs::Htc.count.should == 0
          end
        end

      end
    end
  end
end
