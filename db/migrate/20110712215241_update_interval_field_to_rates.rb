class UpdateIntervalFieldToRates < ActiveRecord::Migration
  def self.up
    rename_column :rates, :interval, :interval_time 
  end

  def self.down
    rename_column :rates, :interval_time, :interval
  end
end
