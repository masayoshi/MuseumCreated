# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    provider "MyString"
    uid "MyString"
    token "MyString"
    secret "MyString"
    user_id 1
  end
end
# == Schema Information
#
# Table name: services
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  token      :string(255)
#  secret     :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

