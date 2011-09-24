module ApplicationHelper

  # Return a title on a per-page bassis.
  def title
    base_title = "MusiumCreated.com"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  # Display flash message in twitter-bootstrap
  def display_flash(name,msg)
    case name.to_s
    when "notice" then
      content_tag :div, msg, :class => "alert-message success"
    when "alert" then
      content_tag :div, msg, :class => "alert-message warning"
    else
      content_tag :div, msg, :class => "alert-message info"
    end
  end
end
