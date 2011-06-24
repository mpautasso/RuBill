class ItemsController < ApplicationController
  before_filter :authenticate
  
  active_scaffold :items do |conf|
    config.actions = [:list, :nested]
     
     #conf.sti_children = [:call]
     # conf.nested.add_scoped_link(:type)
  end
end
