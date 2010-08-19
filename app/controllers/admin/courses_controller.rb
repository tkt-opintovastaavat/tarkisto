class Admin::CoursesController < AdminController

     active_scaffold :course do |config|
          config.label = "Course"
          config.columns = [ :code, :name_fi, :credits ]
          list.sorting = {:name_fi => 'ASC'}
          columns[:code].label = "Code: #"
          columns[:name_fi].label = "Name: #"
          columns[:credits].label = "Credits: #"
     end

end
