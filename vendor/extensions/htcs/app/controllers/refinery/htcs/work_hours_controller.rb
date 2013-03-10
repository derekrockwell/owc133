module Refinery
  module Htcs
    class WorkHoursController < ::ApplicationController

      before_filter :ensure_logged_in_volunteer
      before_filter :find_all_work_hours
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @work_hour in the line below:

        # Need to find all WorkHours for the logged-in Volunteer (Devise user)
        # Really we don't want ALL their hours!  That will grow too much... How about all those
        # Created in the past 15 days?

        @work_hours = current_volunteer.work_hours.where("activity_date >= ?", 15.days.ago).order(:activity_date)

        present(@page)
      end


      def new
        # Can only add work hours for the logged-in volunteer
        @work_hour = WorkHour.new()
      end

      def create
        logger.info("Params #{params}")
        @work_hour = current_volunteer.work_hours.new(params["work_hour"])
            
        if @work_hour.save()
          flash[:notice] = "Work Saved"
          redirect_to '/htcs/work_hours'
        else
          flash[:alert] = "Unable to save work hour."
        end
      end


      def show
        @work_hour = WorkHour.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @work_hour in the line below:
        present(@page)
      end

      def destroy
        @work_hour = WorkHour.find(params[:id])
        if @work_hour.destroy
          redirect_to '/htcs/work_hours'
        else
          redirect_to '/htcs/work_hours', :alert => "Unable to delete Work Hour"
        end

    end



    protected

      def find_all_work_hours
        @work_hours = WorkHour.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/work_hours").first
      end

      def ensure_logged_in_volunteer
        # You must be a logg
        if current_volunteer.nil?
          # new_volunteer_session_path
          redirect_to '/volunteers/sign_in'
          return false
        end
      end

    end
  end
end