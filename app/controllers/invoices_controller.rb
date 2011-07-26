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


  def create
    @from = params[:from]
    @to = params[:to]

    @invoice = Invoice.new(:user => current_user)
    @invoice.from = @from.to_date
    @invoice.to = @to.to_date
    @invoice.populate

    if @invoice.save
      redirect_to invoices_path, :notice => 'Success'
    else
      redirect_to invoices_path, :error => 'Error'
    end
  end

end 
