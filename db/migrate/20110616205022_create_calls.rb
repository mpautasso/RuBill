class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.datetime :calldate, :default => '0000-00-00 00:00:00'
      t.string :clid, :limit => 80, :default => ''
      t.string :src, :limit => 80, :default => ''
      t.string :dst, :limit => 80, :default => ''
      t.string :dcontext, :limit => 80, :default => ''
      t.string :channel, :limit => 80, :default => ''
      t.string :dstchannel, :limit => 80, :default => ''
      t.string :lastapp, :limit => 80, :default => ''
      t.string :lastdata, :limit => 80, :default => ''
      t.integer :duration, :default => 0
      t.integer :billsec, :default => 0
      t.string :disposition, :limit => 45, :default => ''
      t.integer :amaflags, :default => 0
      t.string :accountcode, :limit => 20, :default => ''
      t.string :userfield, :limit => 255, :default => ''

      t.timestamps
    end
    add_index :calls, :calldate, :unique => true
    add_index :calls, :dst, :unique => true
    add_index :calls, :accountcode, :unique => true
  end

  def self.down
    drop_table :calls
  end
end
