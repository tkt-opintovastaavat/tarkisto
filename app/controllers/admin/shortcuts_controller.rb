class Admin::ShortcutsController < AdminController

     active_scaffold :shortcut do |config|
          config.label = "Lyhenne"
          config.columns = [ :name, :course_id ]
          list.sorting = {:name => 'ASC'}
          columns[:name].label = "Lyhenne:"
          columns[:course_id].label = "Kurssi ID:"
     end

end
