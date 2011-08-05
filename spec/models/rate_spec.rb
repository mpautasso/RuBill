# == Schema Information
#
# Table name: rates
#
#  id            :integer(4)      not null, primary key
#  prefix        :string(255)
#  initial_time  :integer(4)
#  initial_cost  :decimal(6, 2)   default(0.0), not null
#  interval_time :integer(4)
#  interval_cost :decimal(6, 2)   default(0.0), not null
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Rate do
  pending "add some examples to (or delete) #{__FILE__}"
end
