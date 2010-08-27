class Admin::CourseThemesController < AdminController
  
     active_scaffold :course_theme do |config|
          config.label = "Kurssin teemat"
          config.columns = [ :theme, :course, :description_fi, :description_en, :description_se ]
          list.sorting = {:theme => 'ASC'}
          columns[:theme].label = "Teema:"
          columns[:course].label = "Kurssi:"
          columns[:description_fi].label = "Selitys suomeksi:"
          columns[:description_en].label = "Selitys englanniksi:"
          columns[:description_se].label = "Selitys ruotsiksi:"
     end  
end
