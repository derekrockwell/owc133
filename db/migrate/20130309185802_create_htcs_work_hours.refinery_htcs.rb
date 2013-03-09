# This migration comes from refinery_htcs (originally 3)
class CreateHtcsWorkHours < ActiveRecord::Migration

  def up
    create_table :refinery_htcs_work_hours do |t|
      t.integer :user_id
      t.integer :volunteer_category_id
      t.date :activity_date
      t.float :hours
      t.float :miles
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-htcs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/htcs/work_hours"})
    end

    drop_table :refinery_htcs_work_hours

  end

end
