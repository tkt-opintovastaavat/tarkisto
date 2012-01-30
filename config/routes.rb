Tarkisto::Application.routes.draw do

  devise_for :users

  root :to => "dashboard#show"

  resource :search, :controller => :search, :only => [:show]

  resource :faq, :controller => :faq, :only => [:show]

  resource :image, :only => [:create] do

    member do
      post :formula
    end

  end

  resources :codes, :only => [:create, :show]

  resources :courses, :only => [:index] do

    collection do
      get :basics
      get :intermediates
      get :advanceds
      get :others
    end

    resources :exams, :only => [:index, :show, :new, :create] do

      collection do
        get :generate
        get :generate_preview
        post :preview
        post :publish
      end

    end

  end

  match 'admin', :controller => 'admin/admin', :as => :admin

  #map.namespace :admin do |admin|
  #  admin.resources :courses, :active_scaffold => true
  #  admin.resources :users, :active_scaffold => true
  #  admin.resources :exams, :active_scaffold => true
  #  admin.resources :themes, :active_scaffold => true
  #  admin.resources :instances, :active_scaffold => true
  #  admin.resources :shortcuts, :active_scaffold => true
  #  admin.resources :levels, :active_scaffold => true
  #  admin.resources :course_themes, :active_scaffold => true
  #  admin.resources :types, :active_scaffold => true
  #end

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
