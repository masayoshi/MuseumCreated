# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    body "MyText"
    user_id 1
    project_id 1
  end
end
# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  body       :text
#  user_id    :integer
#  project_id :integer
#  created_at :datetime
#  updated_at :datetime
#

