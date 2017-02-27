module ApplicationHelper

  # page full title
  def full_title(page_title = nil)
    base_title = "Mentor City"
    page_title.blank? ? base_title : "#{base_title} | #{page_title}"
  end

  def fullname
  "#{@profile.first_name}".titleize + " #{@profile.last_name}".titleize
  end

  # highlight selected class
  def active_class(link_path)
    active = current_page?(link_path) ? "active" : "no-active"
  end
end
