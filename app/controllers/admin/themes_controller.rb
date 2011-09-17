class Admin::ThemesController < AdminController

  active_scaffold :theme do |config|
    config.label = "Teemat"
    config.columns = [ :name_fi, :name_en, :name_se ]
    list.sorting = {:name_fi => 'ASC'}
    columns[:name_fi].label = "Nimi suomeksi:"
    columns[:name_en].label = "Nimi englanniksi:"
    columns[:name_se].label = "Nimi ruotsiksi:"
  end

end
