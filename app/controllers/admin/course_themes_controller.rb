class Admin::CourseThemesController < AdminController
  
     active_scaffold :course_theme do |config|
          config.label = "Kurssin teemat"
          config.columns = [ :theme_name, :description_fi, :description_en, :description_se ]
          list.sorting = {:theme_id => 'ASC'}
          columns[:theme_name].label = "Teema:"
          columns[:description_fi].label = "Selitys suomeksi:"
          columns[:description_en].label = "Selitys englanniksi:"
          columns[:description_se].label = "Selitys ruotsiksi:"
     end
     
end
