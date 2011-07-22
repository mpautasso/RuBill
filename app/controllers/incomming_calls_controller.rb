class IncommingCallsController < ApplicationController

  before_filter :authenticate
  before_filter :require_admin, :except => [:index, :show]
  helper_method :sort_column, :sort_direction

  # GET /incomming_calls
  # GET /incomming_calls.xml
  def index
    @incomming_calls = begin_of_association_chain(IncommingCall)
                          .search(params[:search])
                          .order(sort_column + " " + sort_direction)
                          .paginate(:per_page => 27, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incomming_calls }
      format.js # index.js.haml
    end
  end

  # GET /incomming_calls/1
  # GET /incomming_calls/1.xml
  def show
    @incomming_call = IncommingCall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incomming_call }
    end
  end

  # GET /incomming_calls/new
  # GET /incomming_calls/new.xml
  def new
    @incomming_call = IncommingCall.new
    
    respond_to do |format|
      format.html { render 'new', :layout => false } # new.html.erb
      format.xml  { render :xml => @incomming_call }      
    end
  end

  # GET /incomming_calls/1/edit
  def edit
    @incomming_call = IncommingCall.find(params[:id])
    render 'edit', :layout => false
  end

  # POST /incomming_calls
  # POST /incomming_calls.xml
  def create
    time = [params[:date][:hour], params[:date][:minute], params[:date][:second]].join(':')
    params[:incomming_call][:calldate] = [params[:incomming_call][:calldate], time].join(' ')

    @incomming_call = IncommingCall.new(params[:incomming_call])

    respond_to do |format|
      if @incomming_call.save
        format.js
        format.html { redirect_to(@incomming_call, :notice => 'Incomming call was successfully created.') }
        format.xml  { render :xml => @incomming_call, :status => :created, :location => @incomming_call }
      else
        format.js { render :error }
        format.html { render :action => "new" }
        format.xml  { render :xml => @incomming_call.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /incomming_calls/1
  # PUT /incomming_calls/1.xml
  def update
    time = [params[:date][:hour], params[:date][:minute], params[:date][:second]].join(':')
    params[:incomming_call][:calldate] = [params[:incomming_call][:calldate], time].join(' ')
    @incomming_call = IncommingCall.find(params[:id])

    respond_to do |format|
      if @incomming_call.update_attributes(params[:incomming_call])
        format.js
        format.html { redirect_to(@incomming_call, :notice => 'Incomming call was successfully updated.') }
        format.xml  { head :ok }
      else
        format.js { render :error }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incomming_call.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /incomming_calls/1
  # DELETE /incomming_calls/1.xml
  def destroy
    @incomming_call = IncommingCall.find(params[:id])
    @incomming_call.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(incomming_calls_url) }
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
