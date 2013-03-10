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

        if @volunteer.save
          @page = ::Refinery::Page.where(:slug => "thanks").first
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
