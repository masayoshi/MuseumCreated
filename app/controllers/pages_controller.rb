class PagesController < ApplicationController
  def home
    @skills = User.tag_counts_on(:skills)
    @interests = User.tag_counts_on(:interests)
    @recent_login_users = User.recent_login
    @recent_confirmed_users = User.recent_confirmed
  end

  def about
  end

  def policy
  end

  def copyright
  end

  def search
  end
  
  def help
  end
end
