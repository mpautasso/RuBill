# == Schema Information
#
# Table name: devices
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  exten      :string(255)
#  priority   :integer(4)
#  app        :string(255)
#  app_data   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Device < ActiveRecord::Base
  belongs_to :user

  has_many :outgoing_calls, :foreign_key => :src, :primary_key => :exten
  has_many :incomming_calls, :foreign_key => :src, :primary_key => :exten
  has_many :failed_calls, :foreign_key => :src, :primary_key => :exten
 
  validates :exten, :presence => true,
                    :uniqueness => true
  
  validates :user, :presence => true
  validates_associated :user
  
  def to_s
    exten
  end

  def self.search(search)
    if search
      where('exten LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
