class ChangeItemByReferenceInItems < ActiveRecord::Migration
  def self.up
    rename_column :items, :item_type, :reference_type
    rename_column :items, :item_id, :reference_id
  end

  def self.down
    rename_column :items, :reference_type, :item_type
    rename_column :items, :reference_id, :item_id
  end
end
