module ApplicationHelper

  def title(title)
    "Tenttiarkisto #{":: #{title}" unless title.blank?}"
  end

end
