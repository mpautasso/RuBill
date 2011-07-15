class InvoicesController < ApplicationController

  before_filter :authenticate
  
  def index
    @invoices = Invoice.all 
  end

  def filter_calls
    from = build_date_from_params('from', params[:invoice])
    to = build_date_from_params('to', params[:invoice])

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
