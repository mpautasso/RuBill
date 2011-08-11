class CsvFile < ActiveRecord::Base
  attr_accessible :user_id, :csv

  belongs_to :user

  has_attached_file :csv#, :path => ":rails_root/public/system/csvs/:style.:extension"

  def self.search(search)
    if search
      where('csv_file_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
