module Refinery
  module Htcs
    class HtcsController < ::ApplicationController

      before_filter :find_all_htcs
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @htc in the line below:
        present(@page)
      end

      def show
        @htc = Htc.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @htc in the line below:
        present(@page)
      end

    protected

      def find_all_htcs
        @htcs = Htc.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/htcs").first
      end

    end
  end
end
