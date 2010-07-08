ActionController::Routing::Routes.draw do |map|

     map.root :controller => :dashboard, :action => :show

     map.resource :session, :controller => :session, :only => [:create, :destroy]

     map.resource :search, :controller => :search, :only => [:show]

     map.resources :exams, :path_prefix => "courses/:course_id", :only => [:index, :show, :new, :create, :edit, :update], :collection => {:generate => :get} do |exam|
          exam.resources :questions, :only => [:show]
     end

     map.resource :faq, :controller => :faq, :only => [:show]

     map.namespace :admin do |admin|
          admin.resources :courses
          admin.resources :users
     end

end
