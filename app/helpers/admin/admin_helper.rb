module Admin::AdminHelper

  def major_sidebar_attrs(section)
    if section == @section
      { class: "major active" }
    else
      { class: "major inactive" }
    end
  end

end
