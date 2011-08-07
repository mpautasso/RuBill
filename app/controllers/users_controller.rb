class UsersController < ApplicationController
  before_filter :authenticate
  before_filter :require_admin
  helper_method :sort_column, :sort_direction

  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 27, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.js # index.js.haml
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def new
    @user = User.new
    @user.build_device
    session[:user_return_to] = users_path

    respond_to do |format|
      format.html { render :template => 'users/new', :layout => false}
      format.xml  { render :xml => @user }
    end

  end

  def edit
    @user = User.find(params[:id])
    @user.build_device if @user.device.nil?
    render 'edit', :layout => false
  end

  def create
    @user = User.new(params[:user])

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
