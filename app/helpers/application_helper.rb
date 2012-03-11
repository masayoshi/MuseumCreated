module ApplicationHelper

  # Return a title on a per-page bassis.
  def title
    base_title = "MuseumCreated.com"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  # Display flash message in twitter-bootstrap
  def display_flash(name,msg)
    str = "<a class='close' data-dismiss='alert'>x</a>".html_safe
    case name.to_s
    when "notice" then
      content_tag :div, str + msg, class: "alert alert-success"
    when "alert" then
      content_tag :div, str + msg, :class => "alert alert-error"
    else
      content_tag :div, str + msg, :class => "alert alert-info"
    end
  end

  def artist_image_tag(user, size)
    size = "80px" if size.blank?

    case user.icon_service_name.to_s
    when "twitter" then
      if user.services.find_by_provider("twitter")
        #image_tag Twitter.profile_image( user.services.find_by_provider("twitter").uid, :size => "bigger"), :alt => user.name, :width => size
        gravatar_image_tag(user.email,:alt => user.name, :width => size)
      else
        gravatar_image_tag(user.email,:alt => user.name, :width => size)
      end
    when "facebook" then
      if user.services.find_by_provider("facebook")
        image_tag "http://graph.facebook.com/#{user.services.find_by_provider("facebook").uid}/picture?type=square", alt: user.name, width: size
        #image_tag FbGraph::Page.fetch(user.services.find_by_provider("facebook").uid).picture("large"), :alt => user.name, :width => size
        # gravatar_image_tag(user.email,:alt => user.name, :width => size)
      else
        gravatar_image_tag(user.email,:alt => user.name, :width => size)
      end
    else
      gravatar_image_tag(user.email,:alt => user.name, :width => size)
    end
  end
end
