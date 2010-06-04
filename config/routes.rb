ActionController::Routing::Routes.draw do |map|

     map.root :controller => :dashboard, :action => :show

     map.resource :session, :only => [:create, :destroy]

     map.resource :search, :controller => :search, :only => [:show]

     map.resources :exams, :path_prefix => "courses/:course_id", :collection => {:generate => :get}

     map.resource :faq, :controller => :faq, :only => [:show]

     map.namespace :admin do |admin|
          admin.resources :courses
          admin.resources :users
     end

end
