class InvoicesController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :invoices do |config|
    config.nested.add_link(:outgoing_calls)
  end
#  def index
#    @invoices = Invoice.all 
#  end

#  def new
#    @invoice = Invoice.new
#  end
  
end 
