class Question < ActiveRecord::Base

  belongs_to :exam

  has_many :course_theme_questions
  has_many :course_themes, :through => :course_theme_questions

  has_many :code_snippets
  has_many :images

  has_many :themes, :through => :course_themes

  validates_presence_of :number, :name, :points

  before_validation_on_create :assign_number

  def assign_number
    self.number ||= self.exam.questions.count + 1
  end

  def themes
    course_themes.map { |course_theme| course_theme.theme }
  end

end
