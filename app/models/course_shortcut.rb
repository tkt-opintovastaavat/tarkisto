class CourseShortcut < ActiveRecord::Base
     belongs_to :course

     validates_presence_of :shortcut
end
