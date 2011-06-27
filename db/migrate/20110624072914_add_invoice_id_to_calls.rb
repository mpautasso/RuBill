class AddInvoiceIdToCalls < ActiveRecord::Migration
  def self.up
    add_column :calls, :invoice_id, :integer
  end

  def self.down
    remove_column :calls, :invoice_id
  end
end
