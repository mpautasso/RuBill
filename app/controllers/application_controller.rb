class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  
  ActiveScaffold.set_defaults do |config|
    config.ignore_columns.add [:created_at, :updated_at]
    config.theme = :blue

    config.list.per_page = 20     
  end

  
  private

    def authenticate
      deny_access unless signed_in?
    end
    
end
