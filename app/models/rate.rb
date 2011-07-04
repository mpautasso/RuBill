class Rate < ActiveRecord::Base
  has_many :outgoing_calls

end
