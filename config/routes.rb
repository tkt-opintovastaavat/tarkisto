Tarkisto::Application.routes.draw do

  # BUG: https://github.com/gregbell/active_admin/issues/292
  ActiveAdmin.routes(self) unless ( File.basename($0) == "rake" and not ARGV.nil? and not ARGV.index{ |a| a =~ /^db:\w/i }.nil? )

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

    resources :exams, :only => [:index, :show]

    resources :generated_exams, :only => [:new, :create]

    resource :exam_builder

  end

end
