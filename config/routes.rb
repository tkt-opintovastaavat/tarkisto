ActionController::Routing::Routes.draw do |map|

     map.root :controller => :dashboard, :action => :show

     map.resource :session, :only => [:new, :destroy]

     map.resource :search, :only => [:show]

     map.resources :courses, :only => [:show] do |course|
          course.resources :exams, :collection => {:generate => :get}
     end

     map.resource :faq, :only => [:show]

     map.namespace :admin do |admin|
          admin.resources :courses
          admin.resources :users
     end

end
