ActionController::Routing::Routes.draw do |map|

     map.root :controller => :dashboard, :action => :show

     map.resource :session, :controller => :session, :only => [:create, :destroy]

     map.resource :search, :controller => :search, :only => [:show], :member => {:courses => :get}

     map.resource :faq, :controller => :faq, :only => [:show]

     map.resources :courses, :collection => {:basics => :get, :intermediates => :get, :advanceds => :get, :others => :get}, :only => [:index] do |course|
          course.resources :exams, :only => [:index, :show, :new, :create, :edit, :update], :collection => {:generate => :get}, :member => {:publish => :post} do |exam|
               exam.resources :questions, :only => [:show, :create]
          end
     end

     map.namespace :admin do |admin|
          admin.resources :courses
          admin.resources :users
     end

end
