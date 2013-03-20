module Refinery
  module Htcs
    class WorkHoursController < ::ApplicationController

      before_filter :ensure_logged_in_volunteer, :except => [:runworkreport, :gatherworkreport]
      before_filter :ensure_admin_user, :only => [:runworkreport, :gatherworkreport]
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


      def runworkreport
        # 2013-03-15 - DECj: Taking a crack at a Work Hours Report
        logger.info("In workreport")

        logger.info("Params = #{params}")
        # If you call it like this: 
        # http://localhost:3000/workreport?start_date=01/01/2013&end_date=03/10/2013
        # You'll get these params:
        # Params = {"start_date"=>"01/01/2013", "end_date"=>"03/10/2013", 
        #     "controller"=>"refinery/htcs/work_hours", "action"=>"workreport", "locale"=>:en}
        # Gather all work hours in the date range

        @start_date = params[:start_date]
        @end_date = params[:end_date]

        logger.info("Searching between #{@start_date} and #{@end_date}")

        @work_hours = WorkHour.where("activity_date >= ? and activity_date <= ?", @start_date, @end_date).order(:volunteer_id, :activity_date)

        if @work_hours != nil
          logger.info("found #{@work_hours.count} records")
        else
          logger.info("No work hours found")
        end

        # Make it look nice with bootstrap... This will automatically render 
        # /vendor/extensions/htcs/views/refinery/htcs/work_hours/workreport.html.erb
      end


      def gatherworkreport
        # Bring the user to a form to gather two variables, then move them to runworkreport

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


      def ensure_admin_user
        # You must be a logged in refinery user
        if refinery_user? == false
          # I want you to be a REFINERY user now...
          redirect_to '/refinery'
          return false
        end
      end

    end
  end
end
