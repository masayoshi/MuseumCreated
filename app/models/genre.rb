class Genre < ActiveRecord::Base
  has_many :users
  attr_readonly :name
end
