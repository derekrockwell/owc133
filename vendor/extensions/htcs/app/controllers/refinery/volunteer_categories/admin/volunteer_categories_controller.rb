module Refinery
  module VolunteerCategories
    module Admin
      class VolunteerCategoriesController < ::Refinery::AdminController

        crudify :'refinery/volunteer_categories/volunteer_category',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
