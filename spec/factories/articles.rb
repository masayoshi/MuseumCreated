# == Schema Information
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  url        :string(255)
#  summary    :text
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "MyString"
    url "MyString"
    summary "MyText"
  end
end
