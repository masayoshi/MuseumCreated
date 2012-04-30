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
