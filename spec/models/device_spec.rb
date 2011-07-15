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

require 'spec_helper'

describe Device do
  pending "add some examples to (or delete) #{__FILE__}"
end
