module ApplicationHelper
  # Return a title on a per-page bassis.
  def title
    base_title = "ATTRACT"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def mobile_device?
    # I prefer to treat iPad as non-mobile.
    (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
  end
end
