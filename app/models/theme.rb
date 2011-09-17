class Theme < ActiveRecord::Base
  has_many :course_themes
  has_many :course_theme_questions, :through => :course_themes
  has_many :courses, :through => :course_themes

  validates_presence_of :name_fi

  def name
    if (I18n.locale == :fi)
      return name_fi
    elsif (I18n.locale == :en)
      return name_en
    elsif (I18n.locale == :se)
      return name_se
    end
  end

end
