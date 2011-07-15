# == Schema Information
#
# Table name: rates
#
#  id            :integer(4)      not null, primary key
#  prefix        :string(255)
#  initial_time  :integer(4)
#  initial_cost  :integer(4)
#  interval_time :integer(4)
#  interval_cost :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Rate do
  pending "add some examples to (or delete) #{__FILE__}"
end
