# == Schema Information
#
# Table name: rates
#
#  id            :integer(4)      not null, primary key
#  prefix        :string(255)
#  initial_time  :integer(4)
#  initial_cost  :decimal(6, 2)   default(0.0), not null
#  interval_time :integer(4)
#  interval_cost :decimal(6, 2)   default(0.0), not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Rate < ActiveRecord::Base

  has_many :outgoing_calls

  validates :prefix, :initial_time, :initial_cost, :interval_time, :interval_cost, :presence => true
  validates_numericality_of :initial_time, :initial_cost, :interval_time, :interval_cost, :greater_than_or_equal_to => 0

  def self.search(search)
    if search
      where('prefix LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
