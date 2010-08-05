class Exam < ActiveRecord::Base
     belongs_to :course
     belongs_to :type
     has_many :questions

     validates_presence_of :date, :maximum_points

     named_scope :repeat_exams, :conditions => {:type_id => Type.find_by_name_fi('Uusintakoe').id}
     named_scope :course_exams, :conditions => {:type_id => Type.find_by_name_fi('Kurssikoe').id}
     named_scope :separate_exams, :conditions => {:type_id => Type.find_by_name_fi('Erilliskoe').id}
     named_scope :unpublished, :conditions => {:published => false}
     named_scope :published, :conditions => {:published => true}
     named_scope :public, :conditions => { :published => true, :public => true}
     named_scope :private, :conditions => { :published => true, :public => false}
     named_scope :only_private, :conditions => {:public => false}
     named_scope :only_public, :conditions => {:public => true}

     def name
          "#{type.name} #{I18n.l date, :format => :short}"
     end

     def publish!
          update_attributes :published => true
     end

     def unpublish!
          update_attributes :published => false
     end

end
