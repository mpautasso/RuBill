class UsersController < ApplicationController
  
  before_filter :authenticate
  helper_method :sort_column, :sort_direction

  # GET /users
  # GET /users.xml
  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 27, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.js # index.js.haml
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    session[:user_return_to] = users_path

    respond_to do |format|
      format.html { render :template => 'users/new', :layout => false}
      format.xml  { render :xml => @user }
    end

  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    render 'edit', :layout => false
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 27, :page => params[:page])

    respond_to do |format|
      if @user.save
        format.js
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.js { render :error }
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.js
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.js { render :error }
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.js
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
 private
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
