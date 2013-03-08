# This migration comes from refinery_menus (originally 5)
class RemoveRefineryPageIdFromRefineryPagePositions < ActiveRecord::Migration
  def up
    remove_column :refinery_page_positions, :refinery_page_id
  end
  
  def down
    add_column :refinery_page_positions, :refinery_page_id, :integer
  end
end
