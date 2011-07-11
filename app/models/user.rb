class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :fullname, :email, :password, :password_confirmation, :remember_me

  has_many :invoices
  has_one :device

  has_many :outgoing_calls, :through => :device
  has_many :incomming_calls, :through => :device
  has_many :failed_calls, :through => :device

  def admin?
    admin
  end
  
  def self.search(search)
    if search
      where('fullname LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
