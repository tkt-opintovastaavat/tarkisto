class ChangeQuestionsToBeRankedAccordingShowingOrderInsteadOfNumber < ActiveRecord::Migration
  class Exam < ActiveRecord::Base
    has_many :questions
  end
  class Question < ActiveRecord::Base
    include RankedModel
    belongs_to :exam
    ranks :showing_order, :with_same => :exam_id
  end

  def self.up
    Exam.all.each do |exam|
      exam.questions.order(:number).each do |question|
        question.update_attribute :showing_order_position, :last
      end
    end
  end

  def self.down
    Exam.all.each do |exam|
      exam.questions.rank(:showing_order).each_with_index do |question, i|
        question.update_attribute :number, i+1
      end
    end
  end
end
