class UsersController < ApplicationController

  active_scaffold :users do |config|
   #actions.exclude :show
   base_cols = [:name, :fullname, :email]
   config.list.columns = base_cols + [:created_at]

   config.create.columns = base_cols + [:password, :password_confirmation]
   config.update.columns = base_cols
   config.list.sorting = [{:name => :asc}]
#   #columns[:superuser].label = 'Super User'
#   #columns[:superuser].form_ui = :checkbox
#   columns[:superuser].inplace_edit = true
   config.search.columns = [:email]

#   config.action_links.add 'impersonate', :label => 'Impersonate',
#     :page => true, :type => :member, :method => :post

#   # active_scaffold_export
#   actions.add :export
#   config.export.columns = [ :id ] + base_cols
#   config.export.default_deselected_columns = [ :avatar ]
#   config.export.default_delimiter = ','
#   config.export.force_quotes = true

 
  end        
  
end
