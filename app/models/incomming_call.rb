class IncommingCall < ActiveRecord::Base
  belongs_to :device
  belongs_to :invoice

end

