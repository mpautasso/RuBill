class Device < ActiveRecord::Base
  belongs_to :user
  has_many :outgoing_calls, :foreign_key  => 'src'
  has_many :incomming_calls, :foreign_key  => 'dst'
end
