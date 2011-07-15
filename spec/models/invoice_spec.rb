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

require 'spec_helper'

describe Invoice do
  pending "add some examples to (or delete) #{__FILE__}"
end
