class CreateWorkHours < ActiveRecord::Migration

  def up
    create_table :work_hours, :force => true do |t|
      t.integer :volunteer_category_id
      t.integer :user_id
      t.date :activity_date
      t.float :hours
      t.float :miles

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-htcs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/htcs/htcs"})
    end

    drop_table :refinery_htcs

  end

end
