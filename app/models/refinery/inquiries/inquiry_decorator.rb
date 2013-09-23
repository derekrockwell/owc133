module Refinery
  module Inquiries
    class Inquiry < Refinery::Core::BaseModel

      def ham?
        true
      end

      def spam=(value)
        write_attribute :spam, false
      end

    end
  end
end