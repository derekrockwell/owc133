module Refinery
  module WorkHours
		class WorkHour < Refinery::Core::BaseModel
			self.table_name = 'refinery_work_hours'
			belongs_to :volunteer_category

			attr_accessible :activity_date, :user_id, :hours, :volunteer_category, :volunteer_category_id, :miles

			validates_presence_of :activity_date, :hours, :volunteer_category_id
		end
	end
end
