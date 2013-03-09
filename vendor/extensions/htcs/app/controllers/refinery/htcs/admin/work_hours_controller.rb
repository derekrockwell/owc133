module Refinery
  module Htcs
    module Admin
      class WorkHoursController < ::Refinery::AdminController

        crudify :'refinery/htcs/work_hour', :xhr_paging => true

      end
    end
  end
end
