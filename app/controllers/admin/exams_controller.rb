class Admin::ExamsController < AdminController

     active_scaffold :exam do |config|
          config.label = "Exam"
          config.columns = [ :date, :course_id, :maximum_points, :public, :published ]
          list.sorting = {:date => 'ASC'}
          columns[:date].label = "Date: #"
          columns[:course_id].label = "Course ID: #"          
          columns[:maximum_points].label = "Maximum points: #"
          columns[:public].label = "Is public?: #"
          columns[:published].label = "Is published?: #"
     end
                                                                 
end
