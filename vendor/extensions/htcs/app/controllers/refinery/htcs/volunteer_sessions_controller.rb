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
		    
		    volunteer = authenticate_volunteer!(:recall => "refinery/htcs/volunteer_sessions#new")
		    
		    if params[:volunteer][:password] == "changeme"
		    	flash[:notice] = "Please update your password"
		    	redirect_to '/htcs/volunteers/edit_password'
		    else
			    flash[:notice] = "You are now signed in!"
			    sign_in volunteer
			    redirect_to '/htcs/work_hours'
			end
		  end
		 
		  def destroy
		    sign_out current_volunteer
		    flash[:notice] = "You are now signed out!"
		    redirect_to '/'
		  end
		end
	end
end