module ApplicationHelper

  def title
    base_title = "Gold and Glory"

    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
