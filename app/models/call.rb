class Call < ActiveRecord::Base
  has_many :items, :as => :reference
  belongs_to :outgoing_device, :primary_key => "src", :foreign_key => "device_id"
  belongs_to :incomming_device, :primary_key => "dst", :foreign_key => "device_id"
end