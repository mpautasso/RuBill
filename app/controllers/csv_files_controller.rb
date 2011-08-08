class CsvFilesController < ApplicationController
  # GET /csv_files
  # GET /csv_files.xml
  def index
    @csv_files = CsvFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @csv_files }
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
      format.html # new.html.erb
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
    @csv_file = CsvFile.new(params[:csv_file].merge(:user_id => current_user.id))

    respond_to do |format|
      if @csv_file.save
        format.html { redirect_to(@csv_file, :notice => 'Csv file was successfully created.') }
        format.xml  { render :xml => @csv_file, :status => :created, :location => @csv_file }
      else
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
end
