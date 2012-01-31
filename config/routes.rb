Tarkisto::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users

  root :to => "home#show"

  match 'search' => "search#show"
  match 'faq' => "faq#show"

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
        post :publish
      end

    end

  end

end
