class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.integer :user_id
      t.string :exten
      t.integer :priority
      t.string :app
      t.string :appd_ata

      t.timestamps
    end
    add_column :outgoing_calls, :device_id, :integer
    add_column :incomming_calls, :device_id, :integer
    add_column :failed_calls, :device_id, :integer

  end

  def self.down
    drop_table :devices
    remove_column :outgoing_calls, :device_id
    remove_column :incomming_calls, :device_id
    remove_column :failed_calls, :device_id
  end
end
