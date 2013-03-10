class RemoveInquiries < ActiveRecord::Migration
  def up

    ::Refinery::UserPlugin.destroy_all :name => "refinerycms_inquiries"

   ::Refinery::Page.delete_all({
     :link_url => ("/contact" || "/contact/thank_you")
     }) if defined?(::Refinery::Page)
end

def down
end
end
