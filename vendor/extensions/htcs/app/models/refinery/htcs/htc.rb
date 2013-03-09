module Refinery
  module Htcs
    class Htc < Refinery::Core::BaseModel
      self.table_name = 'refinery_htcs'

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
