ActionController::Routing::Routes.draw do |map|

  ssl = !Rails.env.development?

  map.root :controller => :dashboard, :action => :show, :ssl => ssl
  map.resource :dashboard, :controller => :dashboard, :only => [:show], :ssl => ssl

  map.resource :session, :controller => :session, :only => [:create, :destroy], :ssl => ssl

  map.resource :search, :controller => :search, :only => [:show], :member => {:courses => :get}, :ssl => ssl

  map.resource :faq, :controller => :faq, :only => [:show], :ssl => ssl

  map.resource :image, :only => [:create], :member => {:formula => :post}, :ssl => ssl

  #map.connect 'image/:id', :controller => 'images', :action => 'getImageURL', :id => '/\d+, :ssl => ssl'

  map.resources :codes, :only => [:create, :show], :ssl => ssl

  map.resources :courses, :collection => {:basics => :get, :intermediates => :get, :advanceds => :get, :others => :get}, :only => [:index], :ssl => ssl do |course|
    course.resources :exams, :only => [:index, :show, :new, :create], :collection => {:generate => :get, :generate_preview => :get, :preview => :post, :publish => :post}, :ssl => ssl
  end

  map.admin 'admin', :controller => 'admin/admin', :ssl => ssl

  map.namespace :admin do |admin|
    admin.resources :courses, :active_scaffold => true, :ssl => ssl
    admin.resources :users, :active_scaffold => true, :ssl => ssl
    admin.resources :exams, :active_scaffold => true, :ssl => ssl
    admin.resources :themes, :active_scaffold => true, :ssl => ssl
    admin.resources :instances, :active_scaffold => true, :ssl => ssl
    admin.resources :shortcuts, :active_scaffold => true, :ssl => ssl
    admin.resources :levels, :active_scaffold => true, :ssl => ssl
    admin.resources :course_themes, :active_scaffold => true, :ssl => ssl
    admin.resources :types, :active_scaffold => true, :ssl => ssl
  end

end
