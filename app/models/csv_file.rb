class CsvFile < ActiveRecord::Base
  attr_accessible :user_id, :csv

  belongs_to :user
  
  validates :csv_file_name, :uniqueness => true
  validates_attachment_presence :csv
  validates_attachment_content_type :csv, :content_type => ['application/x-crossover-csv']
  
  has_attached_file :csv,
                    :path => ":attachment/:id/:style/:filename",
                    :url => "http://ftp.drivehq.com/archivos/:attachment/:id/:style/:filename",
                    :storage => :ftp,
                    :ftp_credentials => Rails.root.join('config', 'paperclipftp.yaml'),
                    :ftp_passive_mode => true
  

  def self.search(search)
    if search
      where('csv_file_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
end
