# This migration comes from refinery_menus (originally 3)
class AddMenuMatchToPagePositions < ActiveRecord::Migration
  def change
    add_column :refinery_page_positions, :menu_match, :string

  end
end
