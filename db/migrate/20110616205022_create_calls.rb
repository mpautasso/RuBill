class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.datetime :calldate, :null => false, :default => '0000-00-00 00:00:00'
      t.string :clid, :null => false, :limit => 80, :default => ''
      t.string :src, :null => false, :limit => 80, :default => ''
      t.string :dst, :null => false, :limit => 80, :default => ''
      t.string :dcontext, :null => false, :limit => 80, :default => ''
      t.string :channel, :null => false, :limit => 80, :default => ''
      t.string :dstchannel, :null => false, :limit => 80, :default => ''
      t.string :lastapp, :null => false, :limit => 80, :default => ''
      t.string :lastdata, :null => false, :limit => 80, :default => ''
      t.integer :duration, :null => false, :default => 0
      t.integer :billsec, :null => false, :default => 0
      t.string :disposition, :null => false, :limit => 45, :default => ''
      t.integer :amaflags, :null => false, :default => 0
      t.string :accountcode, :null => false, :limit => 20, :default => ''
      t.string :userfield, :null => false, :limit => 255, :default => ''

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
