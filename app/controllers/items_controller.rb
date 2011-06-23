class ItemsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :items do |conf|
     global_as_config(conf)
     
     #conf.sti_children = [:call]
     conf.nested.add_scoped_link(:type)
  end
end
