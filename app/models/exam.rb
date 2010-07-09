class Exam < ActiveRecord::Base
     belongs_to :course
     belongs_to :type
     has_many :questions

     validates_presence_of :date, :maximum_points

     named_scope :unpublished, :conditions => {:published => false}
     named_scope :published, :conditions => {:published => true}
     named_scope :only_private, :conditions => {:public => false}
     named_scope :only_public, :conditions => {:public => true}

     def name
          "#{type.name} #{I18n.l date, :format => :short}"
     end

     def publish!
          unless questions.empty?
               update_attributes :published => true
          else
               false
          end
     end

     def unpublish!
          update_attributes :published => false
     end

     def to_public
          {:id => id, :type => type_id, :edate => I18n.l(date, :format => :short), :maxpoints => maximum_points}
     end

end
