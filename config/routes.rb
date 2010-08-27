ActionController::Routing::Routes.draw do |map|
         
     map.root :controller => :dashboard, :action => :show

     map.resource :session, :controller => :session, :only => [:create, :destroy]

     map.resource :search, :controller => :search, :only => [:show], :member => {:courses => :get}

     map.resource :faq, :controller => :faq, :only => [:show]

     map.resource :image, :only => [:create], :member => {:formula => :post}

     #map.connect 'image/:id', :controller => 'images', :action => 'getImageURL', :id => '/\d+'

     map.resources :codes, :only => [:create, :show]

     map.resources :courses, :collection => {:basics => :get, :intermediates => :get, :advanceds => :get, :others => :get}, :only => [:index] do |course|
          course.resources :exams, :only => [:index, :show, :new, :create], :collection => {:generate => :get, :generate_preview => :get, :preview => :post, :publish => :post}
     end

     map.admin 'admin', :controller => 'admin/admin'     

     map.namespace :admin do |admin|
          admin.resources :courses, :active_scaffold => true
          admin.resources :users, :active_scaffold => true
          admin.resources :exams, :active_scaffold => true
          admin.resources :themes, :active_scaffold => true
          admin.resources :instances, :active_scaffold => true
          admin.resources :shortcuts, :active_scaffold => true
          admin.resources :levels, :active_scaffold => true
          admin.resources :course_themes, :active_scaffold => true
          admin.resources :types, :active_scaffold => true
     end

end
