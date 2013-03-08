# This migration comes from refinery_menus (originally 8)
class RenamePageMenusToMenus < ActiveRecord::Migration
  def change
    rename_table :refinery_page_menus, :refinery_menus
  end

end
