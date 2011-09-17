class Admin::ShortcutsController < AdminController

  active_scaffold :shortcut do |config|
    config.label = "Lyhenne"
    config.columns = [ :name, :course ]
    list.sorting = {:name => 'ASC'}
    columns[:name].label = "Lyhenne:"
    columns[:course].label = "Kurssi:"
  end

end
