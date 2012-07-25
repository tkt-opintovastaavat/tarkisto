class Question < ActiveRecord::Base

  include RankedModel

  belongs_to :exam

  has_many :course_theme_questions
  has_many :course_themes, :through => :course_theme_questions

  has_many :code_snippets
  has_many :images

  has_many :themes, :through => :course_themes

  validates_presence_of :name, :points

  ranks :showing_order, :with_same => :exam_id

  def themes
    course_themes.map { |course_theme| course_theme.theme }
  end

end
