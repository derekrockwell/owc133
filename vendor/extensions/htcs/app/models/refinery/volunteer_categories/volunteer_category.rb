module Refinery
  module VolunteerCategories
    class VolunteerCategory < Refinery::Core::BaseModel
      self.table_name = 'refinery_volunteer_categories'

      attr_accessible :name, :sequence, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
