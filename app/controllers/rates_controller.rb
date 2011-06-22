class RatesController < ApplicationController
    
  active_scaffold :rate do |conf|
    global_as_config(conf)
  end

end
