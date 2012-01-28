class Exam < ActiveRecord::Base

  belongs_to :course
  belongs_to :type
  has_many :questions

  attr_protected :public, :published

  validates_uniqueness_of :date, :scope => :type_id
  validates_presence_of :date, :maximum_points
  validates_numericality_of :maximum_points, :only_integer => true, :greater_than => 0, :unless =>Proc.new { |exam| exam.maximum_points.nil? }
  validate_on_update :validate_points

  named_scope :course_exams, :conditions => {:type_id => Type.course_exams.id}
  named_scope :repeat_exams, :conditions => {:type_id => Type.renewal_exams.id}
  named_scope :separate_exams, :conditions => {:type_id => Type.separate_exams.id}
  named_scope :generated_exams, :conditions => {:type_id => Type.generated_exams.id}
  named_scope :unpublished, :conditions => {:published => false}
  named_scope :published, :conditions => {:published => true}
  named_scope :public, :conditions => { :published => true, :public => true}
  named_scope :only_private, :conditions => {:public => false}
  named_scope :only_public, :conditions => {:public => true}

  def name
    "#{type.name} #{I18n.l date, :format => :short}"
  end

  def publish!
    unless questions.empty? or questions.map(&:valid?).uniq.include? false or not valid?
      self.update_attribute :published, true
    else
      false
    end
  end

  def unpublish!
    self.update_attribute :published, false
  end

  def to_public
    {:id => id, :type => type_id, :edate => I18n.l(date, :format => :short), :maxpoints => maximum_points}
  end

  def validate_points
    errors.add 'maximum_points', I18n.t('activerecord.errors.messages.points_not_match') unless questions.map{|q| q.points.to_i}.sum == maximum_points
  end

end
