Portfolio::Application.routes.draw do

  get '/log_in' => "sessions#new", :as => "log_in"
  get '/log_out' => "sessions#destroy", :as => "log_out"
  resources :sessions, :only => [:create]

  resources :blog, :only => [:index, :show]
  resources :projects, :only => [:index, :show]

  namespace :admin do 
    resources :posts
    resources :projects
  end

  root :to => 'blog#index'

end
