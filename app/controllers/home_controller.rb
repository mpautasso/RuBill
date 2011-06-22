class HomeController < ApplicationController
  layout 'application'
  
  before_filter :authenticate
  
  def index
  end  
end
