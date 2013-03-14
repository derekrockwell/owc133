Refinery::Htcs::VolunteersController.class_eval do
  
    before_filter :footer
  
    protected
    
      def footer
        @footer = Refinery::Page.by_slug("footer").first
      end

  end