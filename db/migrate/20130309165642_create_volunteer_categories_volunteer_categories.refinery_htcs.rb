# This migration comes from refinery_htcs (originally 2)
class CreateVolunteerCategoriesVolunteerCategories < ActiveRecord::Migration

  def up
    create_table :refinery_volunteer_categories, :force => true do |t|
      t.string :name
      t.integer :sequence
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-volunteer_categories"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/volunteer_categories/volunteer_categories"})
    end

    drop_table :refinery_volunteer_categories

  end

end
