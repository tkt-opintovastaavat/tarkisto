class Admin::CourseThemesController < AdminController
  
     active_scaffold :course_theme do |config|
          config.label = "Kurssin teemat"
          config.columns = [ :theme_id, :description_fi, :description_en, :description_se, :course_id ]
          list.sorting = {:theme_id => 'ASC'}
          columns[:theme_id].label = "Teema ID:"
          columns[:description_fi].label = "Selitys suomeksi:"
          columns[:description_en].label = "Selitys englanniksi:"
          columns[:description_se].label = "Selitys ruotsiksi:"
          columns[:course_id].label = "Kurssi ID:"
     end
     
end
