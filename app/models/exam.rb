class Exam < ActiveRecord::Base

  belongs_to :course
  belongs_to :type
  has_one :exam_builder
  has_many :questions

  attr_protected :public, :published

  validates_uniqueness_of :date, :scope => :type_id
  validates_presence_of :date, :maximum_points
  validates_numericality_of :maximum_points, :only_integer => true, :greater_than => 0, :unless =>Proc.new { |exam| exam.maximum_points.nil? }
  validate :validate_points, :on => :update

  scope :course_exams, where(:type_id => Type.course_exams.try(:id))
  scope :repeat_exams, where(:type_id => Type.renewal_exams.try(:id))
  scope :separate_exams, where(:type_id => Type.separate_exams.try(:id))
  scope :generated_exams, where(:type_id => Type.generated_exams.try(:id))
  scope :unpublished, where(:published => false)
  scope :published, where(:published => true)
  scope :public, published.where(:public => true)
  scope :only_private, where(:public => false)
  scope :only_public, where(:public => true)

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
