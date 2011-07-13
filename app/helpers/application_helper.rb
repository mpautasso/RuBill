module ApplicationHelper

  def logo
     logo = image_tag("logo.png", :alt => "Asterisx rubill", :class => "round")
  end

  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge({:sort => column, :direction => direction}), {:class => css_class}
  end

end
