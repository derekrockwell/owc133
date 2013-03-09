module Refinery
  module Htcs
    module Admin
      class HtcsController < ::Refinery::AdminController

        crudify :'refinery/htcs/htc',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
