ActionController::Routing::Routes.draw do |map|
  map.connect 'jspec/:action/:id.:format', :controller => 'jspec'
end
