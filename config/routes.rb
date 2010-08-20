ActionController::Routing::Routes.draw do |map|

     map.root :controller => :dashboard, :action => :show

     map.resource :session, :controller => :session, :only => [:create, :destroy]

     map.resource :search, :controller => :search, :only => [:show], :member => {:courses => :get}

     map.resource :faq, :controller => :faq, :only => [:show]

     map.resource :image, :only => [:create], :member => {:formula => :post}

     map.connect 'image/:id', :controller => 'images', :action => 'getImageURL', :id => '/\d+'

     map.resource :code, :only => [:create]

     map.resources :courses, :collection => {:basics => :get, :intermediates => :get, :advanceds => :get, :others => :get}, :only => [:index] do |course|
          course.resources :exams, :only => [:index, :show, :new, :create], :collection => {:generate => :get, :preview => :post, :publish => :post}
     end

     map.namespace :admin do |admin|
          admin.resources :courses
          admin.resources :users
     end

end
