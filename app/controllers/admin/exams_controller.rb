class Admin::ExamsController < AdminController

     active_scaffold :exam do |config|
          config.label = "Koe"
          config.columns = [ :type_id, :course, :maximum_points, :public, :published, :date, :language, :created_at, :updated_at ]
          list.sorting = {:date => 'ASC'}
          columns[:date].label = "Päivämäärä:"
          columns[:course].label = "Kurssi:"          
          columns[:maximum_points].label = "Maksimipisteet:"
          columns[:public].label = "Julkinen:"
          columns[:published].label = "Julkaistu:"
          columns[:type_id].label = "Tyyppi ID:"
          columns[:language].label = "Kieli:"
          columns[:created_at].label = "Luotu:"
          columns[:updated_at].label = "Päivitetty"
     end
                                                                 
end
