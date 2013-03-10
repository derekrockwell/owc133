class RemoveNews < ActiveRecord::Migration
  def up

    ::Refinery::UserPlugin.destroy_all :name => "refinerycms_news"
    ::Refinery::Page.delete_all :link_url => "/news"

end

def down
end
end
