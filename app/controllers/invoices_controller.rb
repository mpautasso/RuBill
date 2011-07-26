class InvoicesController < ApplicationController

  before_filter :authenticate
  
  def index
    @invoices = Invoice.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
    end
    
  end
  
  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
      format.pdf { render :layout => false } # Add this line
    end
  end

  def filter_calls  
    from = params[:invoice][:from]
    to = params[:invoice][:to]

    if current_user.admin?
      @calls = OutgoingCall.created_since(from)
    else
      if current_user.device
        @calls = OutgoingCall.created_since(from).created_until(to).select{|x| x.src == current_user.device.exten}
      else
        @calls = []
      end
    end

    respond_to do |format|
      format.js
    end
  end

end 
