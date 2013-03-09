module Refinery
  module Htcs
    class Volunteer < Refinery::Core::BaseModel

      attr_accessible :first_name, :last_name, :phone_number, :email, :address, :city, :state, :zip, :position

      acts_as_indexed :fields => [:first_name]

      validates_presence_of :first_name, :last_name, :zip
      validates :email, :presence => true, :uniqueness => true
    end
  end
end
