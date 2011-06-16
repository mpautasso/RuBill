class AddTypeToCalls < ActiveRecord::Migration
  def self.up
    add_column :calls, :type, :string
  end

  def self.down
    remove_column :calls, :type
  end
end
