ActionController::Routing::Routes.draw do |map|

  map.root :controller => :dashboard, :action => :show, :ssl => true
  map.resource :dashboard, :controller => :dashboard, :only => [:show], :ssl => true

  map.resource :session, :controller => :session, :only => [:create, :destroy], :ssl => true

  map.resource :search, :controller => :search, :only => [:show], :member => {:courses => :get}, :ssl => true

  map.resource :faq, :controller => :faq, :only => [:show], :ssl => true

  map.resource :image, :only => [:create], :member => {:formula => :post}, :ssl => true

  #map.connect 'image/:id', :controller => 'images', :action => 'getImageURL', :id => '/\d+, :ssl => true'

  map.resources :codes, :only => [:create, :show], :ssl => true

  map.resources :courses, :collection => {:basics => :get, :intermediates => :get, :advanceds => :get, :others => :get}, :only => [:index], :ssl => true do |course|
    course.resources :exams, :only => [:index, :show, :new, :create], :collection => {:generate => :get, :generate_preview => :get, :preview => :post, :publish => :post}, :ssl => true
  end

  map.admin 'admin', :controller => 'admin/admin', :ssl => true

  map.namespace :admin do |admin|
    admin.resources :courses, :active_scaffold => true, :ssl => true
    admin.resources :users, :active_scaffold => true, :ssl => true
    admin.resources :exams, :active_scaffold => true, :ssl => true
    admin.resources :themes, :active_scaffold => true, :ssl => true
    admin.resources :instances, :active_scaffold => true, :ssl => true
    admin.resources :shortcuts, :active_scaffold => true, :ssl => true
    admin.resources :levels, :active_scaffold => true, :ssl => true
    admin.resources :course_themes, :active_scaffold => true, :ssl => true
    admin.resources :types, :active_scaffold => true, :ssl => true
  end

end
