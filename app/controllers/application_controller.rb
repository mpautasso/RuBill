class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  
  ActiveScaffold.set_defaults do |config|
    config.ignore_columns.add [:created_at, :updated_at]
    config.theme = :blue

    config.list.per_page = 20     
  end

#  def conditions_for_collection 
##    if active_scaffold_config && active_scaffold_config.model.column_names.include? "user_id" 
##      { :user_id => current_user.id} 
#      
##    end 
#    
#  end 
  
  private

    def authenticate
      deny_access unless signed_in?
    end
    
end
