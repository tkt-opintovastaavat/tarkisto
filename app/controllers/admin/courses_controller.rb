class Admin::CoursesController < AdminController

  active_scaffold :course do |config|
    config.label = "Kurssi"
    config.columns = [ :code, :name_fi, :name_se, :name_en, :level, :credits, :replaced_by, :created_at, :updated_at ]
    list.sorting = {:name_fi => 'ASC'}
    columns[:name_fi].label = "Nimi:"
    columns[:credits].label = "Opintopisteet:"
    columns[:code].label = "Koodi:"
    columns[:name_se].label = "Nimi ruotsiksi:"
    columns[:name_en].label = "Nimi englanniksi:"
    columns[:level].label = "Taso:"
    columns[:replaced_by].label = "Korvattu kurssilla:"
    columns[:created_at].label = "Luotu:"
    columns[:updated_at].label = "Päivitetty:"

  end

end
