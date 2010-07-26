class Exam < ActiveRecord::Base

     belongs_to :course
     belongs_to :type
     has_many :questions

     attr_protected :public, :published

     validates_presence_of :date, :maximum_points
     validate_on_update :validate_points

     named_scope :repeat_exams, :conditions => {:type_id => Type.find_by_name_fi('Uusintakoe').id}
     named_scope :course_exams, :conditions => {:type_id => Type.find_by_name_fi('Kurssikoe').id}
     named_scope :separate_exams, :conditions => {:type_id => Type.find_by_name_fi('Erilliskoe').id}
     named_scope :unpublished, :conditions => {:published => false}
     named_scope :published, :conditions => {:published => true}
     named_scope :only_private, :conditions => {:public => false}
     named_scope :only_public, :conditions => {:public => true}

     def name
          "#{type.name} #{I18n.l date, :format => :short}"
     end

     def publish!
          unless questions.empty?
               questions.each do |question|
                    return false unless question.valid?
               end
               self.published = true if valid?
               save
          else
               false
          end
     end

     def unpublish!
          self.published = false
          save
     end

     def to_public
          {:id => id, :type => type_id, :edate => I18n.l(date, :format => :short), :maxpoints => maximum_points}
     end

     def validate_points
          errors.add 'maximum_points', I18n.t('activerecord.errors.messages.points_not_match') unless questions.map{|q| q.points.to_i}.sum == maximum_points
     end

end
