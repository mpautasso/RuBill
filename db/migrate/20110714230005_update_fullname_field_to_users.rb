class UpdateFullnameFieldToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :fullname, :last_name 
  end

  def self.down
        rename_column :users, :last_name, :fullname 
  end
end
