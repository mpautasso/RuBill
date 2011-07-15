class ChangeAppdAtaOnDevices < ActiveRecord::Migration
  def self.up
    rename_column :devices, :appd_ata, :app_data
  end

  def self.down
    rename_column :devices, :app_data, :appd_ata
  end
end
