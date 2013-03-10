class DeviseCreateVolunteers < ActiveRecord::Migration
  def up
    ## Database authenticatable
    add_column :refinery_htcs_volunteers, :encrypted_password, :string, :null => false, :default => ""

    ## Recoverable
    add_column :refinery_htcs_volunteers, :reset_password_token, :string
    add_column :refinery_htcs_volunteers, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :refinery_htcs_volunteers, :remember_created_at, :datetime

    create_table :roles_volunteers, :id => false do |t|
      t.integer :volunteer_id
      t.integer :role_id
    end

    create_table :refinery_htcs_roles do |t|
      t.string :title
    end
    Refinery::Htcs::Role.new.tap { |role| role.title = 'Volunteer' }.save!

    create_table :refinery_htcs_volunteer_plugins do |t|
      t.integer :volunteer_id
      t.string  :name
      t.integer :position
    end
  end

  def down
    drop_table :refinery_htcs_volunteer_plugins
    drop_table :refinery_htcs_roles
    drop_table :roles_volunteers

    remove_column :refinery_htcs_volunteers, :encrypted_password

    ## Recoverable
    remove_column :refinery_htcs_volunteers, :reset_password_token
    remove_column :refinery_htcs_volunteers, :reset_password_sent_at

    ## Rememberable
    remove_column :refinery_htcs_volunteers, :remember_created_at

  end
end
