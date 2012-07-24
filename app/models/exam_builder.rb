class ExamBuilder < ActiveRecord::Base

  belongs_to :user
  belongs_to :exam
  has_one :course, :through => :exam

  validates_uniqueness_of :user_id

  attr_accessor :date, :maximum_points, :type_id

  def release!
    update_attribute :user_id, nil
  end

end
