ActionController::Routing::Routes.draw do |map|

     map.root :controller => :dashboard, :action => :show

     map.resource :session, :controller => :session, :only => [:create, :destroy]

     map.resource :search, :controller => :search, :only => [:show]

     map.resource :faq, :controller => :faq, :only => [:show]
     
     map.resources :courses, :collection => {:basics => :get, :intermediates => :get, :advanceds => :get, :others => :get}, :only => [:index] do |course|
          course.resources :exams, :collection => {:generate => :get}
     end
          
     map.namespace :admin do |admin|
          admin.resources :courses
          admin.resources :users
     end

end
