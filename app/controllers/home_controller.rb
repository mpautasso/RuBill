class HomeController < ApplicationController

  before_filter :authenticate  
  layout 'application'
  
  before_filter :authenticate
  
  def index
  end


  def import
    call_rake "import_calls"
    redirect_to root_path()
  end
end
