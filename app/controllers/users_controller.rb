class UsersController < ApplicationController

  active_scaffold :users do |conf|
   global_as_config(conf)
   #actions.exclude :show
   base_cols = [:name, :fullname, :email]
   conf.list.columns = base_cols + [:created_at]

   conf.create.columns = base_cols + [:password, :password_confirmation]
   conf.update.columns = base_cols
   conf.list.sorting = [{:name => :asc}]
#   #columns[:superuser].label = 'Super User'
#   #columns[:superuser].form_ui = :checkbox
#   columns[:superuser].inplace_edit = true
   conf.search.columns = [:email]

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
