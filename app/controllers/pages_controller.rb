class PagesController < ApplicationController
  def home
    @interests = User.tag_counts_on(:interests)
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
