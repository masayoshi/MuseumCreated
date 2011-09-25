class User < ActiveRecord::Base
  belongs_to :genre
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :username, :name, :biography, :url, :genre_id

  validates :username, :presence => true, :length => { :within => 3..50 }, :uniqueness => true, :format   => { :with => /\A[_a-zA-Z0-9]+\Z/ } # only A..Za..z0..9-_
  validates :name, :length => { :within => 3..100 },:allow_blank => true
  validates :biography, :length => { :maximum => 1000 }
  validates :url, :format => {:with => URI::regexp(%w(http https))},:allow_blank => true

  paginates_per 2
  
  # For tagging
  acts_as_taggable_on  :skills, :interests ,:areas, :free_words
  attr_accessible :skill_list, :interest_list, :area_list, :free_word_list

end
