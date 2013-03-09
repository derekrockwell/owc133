class DeviseCreateVolunteers < ActiveRecord::Migration
  def change
    ## Database authenticatable
    add_column :volunteers, :encrypted_password, :string, :null => false, :default => ""

    ## Recoverable
    add_column :volunteers, :reset_password_token, :string
    add_column :volunteers, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :volunteers, :remember_created_at, :datetime

    add_index :volunteers, :email,                :unique => true
    add_index :volunteers, :reset_password_token, :unique => true
  end
end
