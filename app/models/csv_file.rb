class CsvFile < ActiveRecord::Base
  attr_accessible :user_id, :csv, :file_name

  belongs_to :user

  has_attached_file :csv
end
