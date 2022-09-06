Rails.application.routes.draw do
  get 'property_owner_dashboards/index'
  get 'user_dashboards/index'
  resources :bookinggs

  resources :properties
  devise_for :users
  get 'home/index'
  root to: "home#index"

  # custom error routes

  match '/404' => 'errors#not_found', :via => :all
  match '/422' => 'errors#unprocessable_entity', :via => :all
  match '/500' => 'errors#internal_server_error', :via => :all

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
