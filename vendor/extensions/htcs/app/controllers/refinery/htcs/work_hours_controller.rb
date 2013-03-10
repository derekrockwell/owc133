module Refinery
  module Htcs
    class WorkHoursController < ::ApplicationController

      before_filter :find_all_work_hours
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @work_hour in the line below:

        # Need to find all WorkHours for the logged-in Volunteer (Devise user)
        @work_hours = current_volunteer.work_hours

        present(@page)
      end

      def show
        @work_hour = WorkHour.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @work_hour in the line below:
        present(@page)
      end

    protected

      def find_all_work_hours
        @work_hours = WorkHour.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/work_hours").first
      end

    end
  end
end
