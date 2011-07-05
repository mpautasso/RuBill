class FailedCall < ActiveRecord::Base
  belongs_to :device
  belongs_to :invoice
  
  validates :src, :presence => true
  
end
