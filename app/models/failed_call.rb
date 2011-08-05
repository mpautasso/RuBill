# == Schema Information
#
# Table name: failed_calls
#
#  id          :integer(4)      not null, primary key
#  calldate    :datetime
#  clid        :string(80)      default("")
#  src         :string(80)      default("")
#  dst         :string(80)      default("")
#  dcontext    :string(80)      default("")
#  channel     :string(80)      default("")
#  dstchannel  :string(80)      default("")
#  lastapp     :string(80)      default("")
#  lastdata    :string(80)      default("")
#  duration    :integer(4)      default(0)
#  billsec     :integer(4)      default(0)
#  disposition :string(45)      default("")
#  amaflags    :integer(4)      default(0)
#  accountcode :string(20)      default("")
#  userfield   :string(255)     default("")
#  created_at  :datetime
#  updated_at  :datetime
#  invoice_id  :integer(4)
#

class FailedCall < ActiveRecord::Base
  belongs_to :device, :foreign_key => 'src', :primary_key => 'exten', :inverse_of => :failed_calls
  belongs_to :invoice
  
  validates :src, :presence => true

  def self.search(search)
    if search
      where('dst LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end

