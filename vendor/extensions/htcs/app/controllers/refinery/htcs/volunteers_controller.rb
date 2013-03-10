module Refinery
  module Htcs
    class VolunteersController < ::ApplicationController

      before_filter :find_all_volunteers
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @volunteer in the line below:
        present(@page)
      end

      def show
        @volunteer = Volunteer.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @volunteer in the line below:
        present(@page)
      end

      def create

        @volunteer = Volunteer.new(params[:volunteer])

        # Since this is a pending user, they get a random password.
        # Use this to get a nice 40 character random string
        @volunteer.password = @volunteer.password_confirmation = Digest::SHA1.hexdigest([Time.now, rand].join)

        if @volunteer.save
          @page = ::Refinery::Page.where(:slug => "thanks").first
          flash[:notice] = "Registration Successful"

          # Now, this is a PENDING Volunteer!  They don't even know their password.
          redirect_to "/volunteer-information/thank-you"
          
        else
          @page = ::Refinery::Page.where(:slug => 'volunteer-information').first
          render :new
        end

      end

      def new
        @page = ::Refinery::Page.where(:slug => 'volunteer-information').first
        @volunteer = Volunteer.new
      end

      def edit_password

      end

      def update_password
        current_volunteer.password = params[:volunteer][:password]
        current_volunteer.password_confirmation = params[:volunteer][:password_confirmation]

        if current_volunteer.save
          flash[:notice] = "Password updated"
          redirect_to '/htcs/work_hours'
        else
          render :action => 'edit_password'
        end
      end


    protected

      def find_all_volunteers
        @volunteers = Volunteer.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/volunteers").first
      end

    end
  end
end
