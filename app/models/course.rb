class Course < ActiveRecord::Base
  include LocalizeName

  has_many :exams
  has_many :questions, :through => :exams
  has_many :shortcuts
  has_many :instances
  has_many :course_themes
  has_many :themes, :through => :course_themes
  belongs_to :level

  validates_presence_of :name_fi, :credits, :code

  scope :basic_courses, :conditions => {:level_id => Level.basic_studies.try(:id)}
  scope :intermediate_courses, :conditions => {:level_id => Level.intermediate_studies.try(:id)}
  scope :advanced_courses, :conditions => {:level_id => Level.advanced_studies.try(:id)}
  scope :other_courses , :conditions => {:level_id => Level.other_studies.try(:id)}

  scope :alphabetize, :order => "name_#{I18n.locale}".to_sym
  scope :courses_on_semester, lambda { |year, semester|
    { :conditions => ["id IN (?)", Instance.on_semester(year, semester).map(&:course_id)] }
  }
  scope :search, lambda { |keyword|
    { :conditions => ["name_#{I18n.locale} ILIKE ?", "%#{keyword}%"] }
  }

  def self.sorting_priority keyword, course1, course2
    first_starts_with_keyword = !course1.name.scan(/^#{keyword}/i).empty?
    second_starts_with_keyword = !course2.name.scan(/^#{keyword}/i).empty?
    if first_starts_with_keyword and second_starts_with_keyword
      course1.name <=> course2.name
    elsif first_starts_with_keyword and not second_starts_with_keyword
      -1
    elsif not first_starts_with_keyword and second_starts_with_keyword
      1
    else
      course1.name <=> course2.name
    end
  end

  def has_exams?
    return !exams.published.empty?
  end

end
