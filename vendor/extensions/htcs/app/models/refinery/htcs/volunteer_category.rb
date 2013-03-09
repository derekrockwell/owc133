module Refinery
  module Htcs
    class VolunteerCategory < Refinery::Core::BaseModel

    	has_and_belongs_to_many :volunteer_categories
      attr_accessible :name, :sequence, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
