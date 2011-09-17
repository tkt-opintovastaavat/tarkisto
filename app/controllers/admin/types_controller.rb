class Admin::TypesController < AdminController

  active_scaffold :type do |config|
    config.label = "Kokeen tyypit"
    config.columns = [ :name_fi, :name_en, :name_se ]
    list.sorting = {:name_fi => 'ASC'}
    columns[:name_fi].label = "Tyyppi suomeksi:"
    columns[:name_en].label = "Tyyppi englanniksi:"
    columns[:name_se].label = "Tyyppi ruotsiksi:"
  end

end
