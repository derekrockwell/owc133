module Refinery
  module Htcs
    module Admin
      class VolunteersController < ::Refinery::AdminController

        crudify :'refinery/htcs/volunteer',
                :title_attribute => 'first_name', :xhr_paging => true

      end
    end
  end
end
