class CreateHtcsVolunteers < ActiveRecord::Migration

  def up
    create_table :refinery_htcs_volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :status
      t.integer :position

      t.timestamps
    end

    rename_column :refinery_htcs_work_hours, :user_id, :volunteer_id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-htcs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/htcs/volunteers"})
    end
    
    rename_column :refinery_htcs_work_hours, :volunteer_id, :user_id
    drop_table :refinery_htcs_volunteers

  end

end
