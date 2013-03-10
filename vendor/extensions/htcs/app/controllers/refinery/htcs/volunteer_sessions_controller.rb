module Refinery
	module Htcs
		class VolunteerSessionsController < ::ApplicationController
		  # For security purposes, Devise just authenticates an user
		  # from the params hash if we explicitly allow it to. That's
		  # why we need to call the before filter below.
		  before_filter :allow_params_authentication!, :only => :create
		 
		  def new
		    @volunteer = Volunteer.new(params[:volunteer])
		  end
		 
		  def create
		    # Since the authentication happens in the rack layer,
		    # we need to tell Devise to call the action "sessions#new"
		    # in case something goes bad. Feel free to change it.
		    logger.info("About to authenticate_volunteer")
		    volunteer = authenticate_volunteer!(:recall => "refinery/htcs/volunteer_sessions#new")
		    logger.info("Back from authenticate")
		    flash[:notice] = "You are now signed in!"
		    sign_in volunteer
		    redirect_to '/htcs/work_hours'
		  end
		 
		  def destroy
		    sign_out current_volunteer
		    flash[:notice] = "You are now signed out!"
		    redirect_to root_path
		  end
		end
	end
end