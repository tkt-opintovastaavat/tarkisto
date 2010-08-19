class Admin::InstancesController < AdminController

     active_scaffold :instance do |config|
          config.label = "Kurssi-instanssit"
          config.columns = [ :course_id, :period, :year, :semester, :created_at, :updated_at ]
          list.sorting = {:year => 'DESC'}
          columns[:course_id].label = "Kurssi ID:"
          columns[:period].label = "Periodi:"
          columns[:year].label = "Vuosi:"
          columns[:semester].label = "Lukukausi:"
          columns[:created_at].label = "Luotu:"
          columns[:updated_at].label = "Päivitetty:"
     end

end
