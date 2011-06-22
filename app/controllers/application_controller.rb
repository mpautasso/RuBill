class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  
  def self.global_as_config(conf)
    conf.theme = :blue

    conf.list.per_page = 20     
  end    
  
  private

    def authenticate
      deny_access unless signed_in?
    end
    
end
