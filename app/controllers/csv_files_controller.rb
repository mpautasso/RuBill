class CsvFilesController < ApplicationController
  before_filter :authenticate
  helper_method :sort_column, :sort_direction
  before_filter :require_admin, :except => [:index, :show]
  
  # GET /csv_files
  # GET /csv_files.xml
  def index
    @csv_files = CsvFile.search(params[:search])
                      .order(sort_column + " " + sort_direction)
                      .paginate(:per_page => 20, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @csv_files }
      format.js # index.js.haml
    end
  end

  # GET /csv_files/1
  # GET /csv_files/1.xml
  def show
    @csv_file = CsvFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @csv_file }
    end
  end

  # GET /csv_files/new
  # GET /csv_files/new.xml
  def new
    @csv_file = CsvFile.new

    respond_to do |format|
      format.js
      format.html { render :template => 'csv_files/new', :layout => false }
      format.xml  { render :xml => @csv_file }
    end
  end

  # GET /csv_files/1/edit
  def edit
    @csv_file = CsvFile.find(params[:id])
  end

  # POST /csv_files
  # POST /csv_files.xml
  def create
    
    @csv_file = CsvFile.new(params[:csv_file])

    respond_to do |format|
      if @csv_file.save
        format.js
        format.html { redirect_to(csv_files_url) }
        format.xml  { render :xml => @csv_file, :status => :created, :location => @csv_file }
      else
        format.js { render :error }
        format.html { render :action => "new" }
        format.xml  { render :xml => @csv_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /csv_files/1
  # PUT /csv_files/1.xml
  def update
    @csv_file = CsvFile.find(params[:id])

    respond_to do |format|
      if @csv_file.update_attributes(params[:csv_file])
        format.html { redirect_to(@csv_file, :notice => 'Csv file was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @csv_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /csv_files/1
  # DELETE /csv_files/1.xml
  def destroy
    @csv_file = CsvFile.find(params[:id])
    @csv_file.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(csv_files_url) }
      format.xml  { head :ok }
    end
  end


  def import
    call_rake "import_calls"

    respond_to do |format|
      format.html { redirect_to(csv_files_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
    def sort_column
      Device.column_names.include?(params[:sort]) ? params[:sort] : "csv_file_name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
end
