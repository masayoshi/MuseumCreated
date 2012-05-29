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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    place "MyString"
    address "MyString"
    latitude 1.5
    longitude 1.5
    description "MyString"
    url "MyString"
    fee "MyString"
    start_time "2012-04-29 17:11:42"
    end_time "2012-04-29 17:11:42"
    user_id 1
  end
end
