# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offer do
    title "MyString"
    description "MyText"
    status 1
    offerer_user_id 1
    offered_user_id 1
  end
end
# == Schema Information
#
# Table name: offers
#
#  id              :integer         not null, primary key
#  title           :string(255)
#  description     :text
#  status          :integer
#  offerer_user_id :integer
#  offered_user_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

