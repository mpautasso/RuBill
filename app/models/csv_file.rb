class CsvFile < ActiveRecord::Base
  attr_accessible :user_id, :csv

  belongs_to :user
  
  validates :csv_file_name, :uniqueness => true
  validates_attachment_presence :csv
  validates_attachment_content_type :csv, :content_type => ['application/x-crossover-csv']
  
  has_attached_file :csv,
                    :path => ":rails_root/public/system/csvs/:basename.:extension",
                    :url => "/system/csvs/:basename.:extension"
  

  def self.search(search)
    if search
      where('csv_file_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
