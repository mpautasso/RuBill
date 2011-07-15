# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  last_name              :string(255)
#  admin                  :boolean(1)      default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :last_name, :email, :password, :password_confirmation
  attr_accessible :remember_me

  has_many :invoices
  has_one :device

  has_many :outgoing_calls, :through => :device
  has_many :incomming_calls, :through => :device
  has_many :failed_calls, :through => :device
  
  
  validates :name, :presence => true, 
                   :length   => { :maximum => 50 }
  
  validates :last_name, :presence => true, 
                       :length   => { :maximum => 50 }                                        
                   
  validates :email, :presence   => true,
                    :uniqueness => { :case_sensitive => false }
                     
  validates :password,  :presence      => true,
                        :confirmation => true, 
                        :if => :password_required?

  def admin?
    admin
  end
  
  def self.search(search)
    if search
      where('last_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

private
 def password_required?
     !password.blank? || !password_confirmation.blank?
  end
end
