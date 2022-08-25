Rails.application.routes.draw do
  get 'property_owner_dashboards/index'
  get 'user_dashboards/index'
  resources :bookinggs
   
  resources :properties
  devise_for :users
  get 'home/index'
    root to: "home#index"
      # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
