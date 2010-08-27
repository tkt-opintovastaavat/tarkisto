class Admin::LevelsController < AdminController

     active_scaffold :level do |config|
          config.label = "Taso"
          config.columns = [ :name_fi, :name_se, :name_en ]
          list.sorting = {:name_fi => 'ASC'}
          columns[:name_fi].label = "Nimi suomeksi:"
          columns[:name_se].label = "Nimi ruotsiksi:"
          columns[:name_en].label = "Nimi englanniksi:"
     end

end
