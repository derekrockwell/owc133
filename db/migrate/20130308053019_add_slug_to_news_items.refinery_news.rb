# This migration comes from refinery_news (originally 20120228150250)
class AddSlugToNewsItems < ActiveRecord::Migration
  def change
    add_column Refinery::News::Item.table_name, :slug, :string
  end
end
