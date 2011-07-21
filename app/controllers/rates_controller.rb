class RatesController < ApplicationController
  
  before_filter :authenticate
  before_filter :require_admin, :except => [:index, :show]
  helper_method :sort_column, :sort_direction

  # GET /rates
  # GET /rates.xml
  def index
    @rates = Rate.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 27, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rates }
      format.js # index.js.haml
    end
  end

  # GET /rates/1
  # GET /rates/1.xml
  def show
    @rate = Rate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rate }
    end
  end

  # GET /rates/new
  # GET /rates/new.xml
  def new
    @rate = Rate.new

    respond_to do |format|
      format.html { render :template => 'rates/new', :layout => false}
      format.xml  { render :xml => @rate }
    end
  end

  # GET /rates/1/edit
  def edit
    @rate = Rate.find(params[:id])
    render 'edit', :layout => false
  end

  # POST /rates
  # POST /rates.xml
  def create
    @rate = Rate.new(params[:rate])

    respond_to do |format|
      if @rate.save
        format.js
        format.html { redirect_to(@rate, :notice => 'Rate was successfully created.') }
        format.xml  { render :xml => @rate, :status => :created, :location => @rate }
      else
        format.js { render :error }
        format.html { render :action => "new" }
        format.xml  { render :xml => @rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rates/1
  # PUT /rates/1.xml
  def update
    @rate = Rate.find(params[:id])

    respond_to do |format|
      if @rate.update_attributes(params[:rate])
        format.js
        format.html { redirect_to(@rate, :notice => 'Rate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.js { render :error }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rates/1
  # DELETE /rates/1.xml
  def destroy
    @rate = Rate.find(params[:id])
    @rate.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(rates_url) }
      format.xml  { head :ok }
    end
  end
  
 private
  
  def sort_column
    Rate.column_names.include?(params[:sort]) ? params[:sort] : "prefix"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
