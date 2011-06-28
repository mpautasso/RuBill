class AddInvoiceIdToCalls < ActiveRecord::Migration
  def self.up
    add_column :outgoing_calls, :invoice_id, :integer
    add_column :incomming_calls, :invoice_id, :integer
    add_column :failed_calls, :invoice_id, :integer
  end

  def self.down
    remove_column :outgoing_calls, :invoice_id
    remove_column :incomming_calls, :invoice_id
    remove_column :failed_calls, :invoice_id
  end
end
