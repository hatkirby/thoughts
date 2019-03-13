module ApplicationHelper

  def title(text)
    content_for :title, text
  end

  def sortable(col, title = nil)
    title ||= col.titleize
    css_class = (col == sort_column) ? "current #{sort_direction}" : nil
    direction = (col == sort_column and sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => col, :dir => direction}, {:class => css_class}
  end

end
