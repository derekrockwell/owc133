module Refinery
	module Htcs
		class Role < ActiveRecord::Base
			has_and_belongs_to_many :volunteers, :join_table => :roles_volunteers

		  before_validation :camelize_title
		  validates :title, :uniqueness => true

		  def camelize_title(role_title = self.title)
		    self.title = role_title.to_s.camelize
		  end 

		  def self.[](title)
		    find_or_create_by_title(title.to_s.camelize)
		  end
		end
	end
end
