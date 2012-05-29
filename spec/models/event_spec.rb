# == Schema Information
#
# Table name: events
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  place       :string(255)
#  address     :string(255)
#  latitude    :float
#  longitude   :float
#  description :string(255)
#  url         :string(255)
#  fee         :string(255)
#  start_time  :datetime
#  end_time    :datetime
#  user_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
end
