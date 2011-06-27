class InvoicesController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :invoices do |config|
    
  end
#  def index
#    @invoices = Invoice.all 
#  end

#  def new
#    @invoice = Invoice.new
#  end
  
end 
