class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :outgoing_calls do |t|
      t.datetime :calldate
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


    create_table :incomming_calls do |t|
      t.datetime :calldate
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


    create_table :failed_calls do |t|
      t.datetime :calldate
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
  end

  def self.down
    drop_table :outgoing_calls
    drop_table :incomming_calls
    drop_table :failed_calls
  end
end
