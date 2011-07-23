class InvoicesController < ApplicationController

  before_filter :authenticate
  
  def index
    @invoices = Invoice.all 
  end

  def filter_calls
  
    from = params[:invoice][:from]
    to = params[:invoice][:to]

#    logger.debug '***************************'
#    logger.debug from

    if current_user.admin?
      @calls = OutgoingCall.created_since(from)
    else
      if current_user.device
        @calls = OutgoingCall.created_since(from).select{|x| x.device_id == current_user.device.exten}
      else
        @calls = []
      end
    end

    respond_to do |format|
      format.js
    end
  end

end 
