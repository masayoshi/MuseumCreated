class User < ActiveRecord::Base
  belongs_to :genre
  has_many :works , :dependent => :destroy
  has_many :feeds, :dependent => :destroy
  has_many :works , :dependent => :destroy
  has_many :offerings, :foreign_key => "offerer_user_id", :class_name => 'Offer', :dependent => :destroy
  has_many :offers, :foreign_key => "offered_user_id", :class_name => 'Offer'
  has_and_belongs_to_many :projects
  has_many :comments, :dependent => :destroy
  has_many :services, :dependent => :destroy
  has_many :locations, dependent: :destroy
  has_many :events, dependent: :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :username, :name, :biography, :url, :genre_id, :icon_service_name

  validates :username, :presence => true, :length => { :within => 3..50 }, :uniqueness => true, :format   => { :with => /\A[_a-zA-Z0-9]+\Z/ } # only A..Za..z0..9-_
  validates :name, :length => { :within => 3..100 },:allow_blank => true
  validates :biography, :length => { :maximum => 1000 }
  validates :url, :format => {:with => URI::regexp(%w(http https))},:allow_blank => true

  paginates_per 10

  # For tagging
  acts_as_taggable_on  :skills, :interests ,:areas, :free_words
  attr_accessible :skill_list, :interest_list, :area_list, :free_word_list


  scope :genre_of, lambda{ |genre_id|
    where("genre_id = ?", genre_id) if genre_id.present?
  }

  scope :name_or_biography_matches, lambda { |search_word|
    where 'username like :q or name like :q or biography like :q',  :q => "%#{search_word}%" if search_word.present?
  }

  scope :tagged_with_interest, lambda { |interest_tag|
    tagged_with(interest_tag, :on => :interests) if interest_tag.present?
  }

  scope :tagged_with_skill, lambda { |skill_tag|
    tagged_with(skill_tag, :on => :skills) if skill_tag.present?
  }

  scope :tagged_with_area, lambda { |area_tag|
    tagged_with(area_tag, :on => :areas) if area_tag.present?
  }

  scope :tagged_with_free_word, lambda { |free_word_tag|
    tagged_with(free_word_tag, :on => :free_words) if free_word_tag.present?
  }

  scope :refine_search, lambda{ |search_params|
    confirmed.
    genre_of(search_params[:genre_id]).
    name_or_biography_matches(search_params[:search_word]).
    tagged_with_interest(search_params[:interest_tag]).
    tagged_with_skill(search_params[:skill_tag]).
    tagged_with_area(search_params[:area_tag]).
    tagged_with_free_word(search_params[:free_word_tag])
  }

  scope :confirmed, where("confirmed_at IS NOT NULL")
  scope :recent_login, confirmed.order("current_sign_in_at desc").limit(8)
  scope :recent_confirmed, confirmed.order("confirmed_at desc").limit(8)

  def apply_omniauth(omniauth)
    omniauth['info']['email'] ? email =  omniauth['info']['email'] : email = ''
    omniauth['info']['nickname'] ? uname =  omniauth['info']['nickname'] : uname = ''
    self.email = email if self.email.blank?
    self.username = uname if self.username.blank?
    self.skip_confirmation!
    connect_service(omniauth)
  end
  
  def connect_service(omniauth)
    omniauth['uid'] ?  uid =  omniauth['uid'] : uid = ''
    omniauth['provider'] ? provider =  omniauth['provider'] : provider = ''
    token = (omniauth['credentials']['token'] rescue nil)
    secret = (omniauth['credentials']['secret'] rescue nil)
    services.build(:provider => provider,:uid => uid,:token => token, :secret => secret)
  end

  def password_required?  
    (services.empty? || !password.blank?) && super  
  end
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)
#  name                   :string(255)
#  biography              :text
#  url                    :string(255)
#  genre_id               :integer
#  icon_service_name      :string(255)
#

