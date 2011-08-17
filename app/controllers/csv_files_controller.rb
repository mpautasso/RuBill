class CsvFilesController < ApplicationController
  before_filter :authenticate
  before_filter :require_admin, :except => [:index, :show]
  helper_method :sort_column, :sort_direction
 
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

  def show
    @csv_file = CsvFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @csv_file }
    end
  end

  def new
    @csv_file = CsvFile.new

    respond_to do |format|
      format.html { render :template => 'csv_files/new', :layout => false }
      format.xml  { render :xml => @csv_file }
    end
  end

  def edit
    @csv_file = CsvFile.find(params[:id])
  end

  def create
    @csv_file = CsvFile.new(params[:csv_file])
    
    respond_to do |format|
      if @csv_file.save
        format.html do
          redirect_to(csv_files_url, :notice => 'Your csv was uploaded')
        end
      else
         format.html do
          redirect_to(csv_files_url, :notice => "Sorry, we can't upload your csv file")
         end
      end
    end
  end

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
    @csv_file = CsvFile.find(params["csv_file_id"])
    call_rake "import_calls[#{@csv_file.csv_file_name}]"
    
    respond_to do |format|
      @csv_file.update_attribute(:imported, true)
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
