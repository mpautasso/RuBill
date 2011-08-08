class InvoicesController < ApplicationController

  before_filter :authenticate
  
  def index

    if current_user.admin?
      @invoices = Invoice.paginate(:per_page => 20, :page => params[:page]) 
    else
      @invoices = Invoice.select{|i| i.user == current_user}.paginate(:per_page => 20, :page => params[:page])
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
      format.js # index.js.haml
    end
    
  end
  
  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice }
      format.js   { render :show, :layout => false}
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
      respond_to do |format|
        format.js 
        format.html {redirect_to invoices_path, :notice => 'Success'}
      end
    else

      redirect_to invoices_path, :error => 'Error'
    end
  end
  
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy

    respond_to do |format|
      format.js   
      format.html { redirect_to(invoices_url) }
      format.xml  { head :ok }
    end
  end

end 
