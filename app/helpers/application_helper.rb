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
end
