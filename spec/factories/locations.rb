# == Schema Information
#
# Table name: locations
#
#  id         :integer         not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  note       :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    address "MyString"
    latitude 1.5
    longitude 1.5
    note "MyString"
    user_id 1
  end
end
