class OutgoingCallsController < ApplicationController

  before_filter :authenticate
  before_filter :require_admin, :except => [:index, :show]
  before_filter :check_device_existence, :unless => lambda{ current_user.admin? }
  helper_method :sort_column, :sort_direction


  def index
    @outgoing_calls = begin_of_association_chain(OutgoingCall).search(params[:search])
                      .order(sort_column + " " + sort_direction)
                      .paginate(:per_page => 20, :page => params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outgoing_calls }
      format.js # index.js.haml
    end
  end


  def show
    @outgoing_call = OutgoingCall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @outgoing_call }
    end
  end


  def new
    @outgoing_call = OutgoingCall.new

    respond_to do |format|
      format.html { render 'new', :layout => false } # new.html.erb
      format.xml  { render :xml => @outgoing_call }
    end
  end


  def edit
    @outgoing_call = OutgoingCall.find(params[:id])
     render 'edit', :layout => false
  end


  def create
    time = [params[:date][:hour], params[:date][:minute], params[:date][:second]].join(':')
    params[:outgoing_call][:calldate] = [params[:outgoing_call][:calldate], time].join(' ')

    @outgoing_call = OutgoingCall.new(params[:outgoing_call])

    respond_to do |format|
      if @outgoing_call.save
        format.js
        format.html { redirect_to(@outgoing_call, :notice => 'Outgoing call was successfully created.') }
        format.xml  { render :xml => @outgoing_call, :status => :created, :location => @outgoing_call }
      else
        format.js   { render :error }
        format.html { render :action => "new" }
        format.xml  { render :xml => @outgoing_call.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    time = [params[:date][:hour], params[:date][:minute], params[:date][:second]].join(':')
    params[:outgoing_call][:calldate] = [params[:outgoing_call][:calldate], time].join(' ')
    @outgoing_call = OutgoingCall.find(params[:id])

    respond_to do |format|
      if @outgoing_call.update_attributes(params[:outgoing_call])
        format.js
        format.html { redirect_to(@outgoing_call, :notice => 'Outgoing call was successfully updated.') }
        format.xml  { head :ok }
      else
        format.js { render :error }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @outgoing_call.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @outgoing_call = OutgoingCall.find(params[:id])
    @outgoing_call.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(outgoing_calls_url) }
      format.xml  { head :ok }
    end
  end
  
 private
  
  def sort_column
    OutgoingCall.column_names.include?(params[:sort]) ? params[:sort] : "calldate"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
