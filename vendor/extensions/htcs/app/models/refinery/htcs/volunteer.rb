module Refinery
  module Htcs
    class Volunteer < Refinery::Core::BaseModel

      attr_accessible :first_name, :position

      acts_as_indexed :fields => [:first_name]

      validates :first_name, :presence => true, :uniqueness => true
    end
  end
end
