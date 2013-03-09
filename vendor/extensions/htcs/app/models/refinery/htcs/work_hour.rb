module Refinery
  module Htcs
    class WorkHour < Refinery::Core::BaseModel
      belongs_to :volunteer_category

      validates_presence_of :user_id, :volunteer_category_id, :activity_date, :hours

      attr_accessible :user_id, :volunteer_category, :volunteer_category_id, :activity_date, :hours, :miles, :position
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.
      def title
        "Override def title in vendor/extensions/htcs/app/models/refinery/htcs/work_hour.rb"
      end
    end
  end
end
