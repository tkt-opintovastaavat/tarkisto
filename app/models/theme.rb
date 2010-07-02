class Theme < ActiveRecord::Base
     belongs_to :course_themes

     validates_presence_of :name_fi
end
