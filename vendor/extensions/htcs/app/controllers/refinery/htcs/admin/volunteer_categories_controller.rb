module Refinery
  module Htcs
    module Admin
      class VolunteerCategoriesController < ::Refinery::AdminController

        crudify :'refinery/htcs/volunteer_category',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
