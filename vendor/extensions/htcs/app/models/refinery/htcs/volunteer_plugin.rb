module Refinery
	module Htcs
		class VolunteerPlugin < ActiveRecord::Base

		  belongs_to :volunteer
		  attr_accessible :volunteer_id, :name, :position

		end
	end
end
