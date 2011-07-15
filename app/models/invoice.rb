# == Schema Information
#
# Table name: invoices
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  from       :datetime
#  to         :datetime
#

class Invoice < ActiveRecord::Base
  belongs_to :user

  has_many :outgoing_calls
  has_many :incomming_calls
  has_many :failed_calls


#  def total
#    items.map(&:cost).sum
#  end
end
