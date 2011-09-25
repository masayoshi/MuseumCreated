class PagesController < ApplicationController
  def home
    @skills = User.tag_counts_on(:skills)
    @interests = User.tag_counts_on(:interests)
    @recent_login_users = User.order("current_sign_in_at desc").limit(5)
    @recent_confirmed_users = User.order("confirmed_at desc").limit(5)
  end

  def about
  end

  def policy
  end

  def copyright
  end

  def contact
  end

end
