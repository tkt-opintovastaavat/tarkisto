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

  named_scope :basic_courses, :conditions => {:level_id => Level.basic_studies.id}
  named_scope :intermediate_courses, :conditions => {:level_id => Level.intermediate_studies.id}
  named_scope :advanced_courses, :conditions => {:level_id => Level.advanced_studies.id}
  named_scope :other_courses , :conditions => {:level_id => Level.other_studies.id}

  named_scope :alphabetize, :order => "name_#{I18n.locale.to_sym}".to_sym
  named_scope :courses_on_semester, lambda { |year, semester|
    { :select => 'distinct courses.*', :joins => :instances, :conditions => ["instances.year = ? AND instances.semester = ?", year, semester] }
  }
  named_scope :search, lambda { |keyword|
    { :conditions => ["name_#{I18n.locale.to_sym} ILIKE ?", "%#{keyword}%"] }
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
