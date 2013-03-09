module Refinery
  module VolunteerCategories
    class VolunteerCategoriesController < ::ApplicationController

      before_filter :find_all_volunteer_categories
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @volunteer_category in the line below:
        present(@page)
      end

      def show
        @volunteer_category = VolunteerCategory.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @volunteer_category in the line below:
        present(@page)
      end

    protected

      def find_all_volunteer_categories
        @volunteer_categories = VolunteerCategory.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/volunteer_categories").first
      end

    end
  end
end
