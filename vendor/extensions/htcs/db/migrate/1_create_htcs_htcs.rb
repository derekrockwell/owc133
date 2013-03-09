class CreateHtcsHtcs < ActiveRecord::Migration

  def up
    create_table :refinery_htcs do |t|
      t.string :name
      t.integer :position

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
