Rails.application.routes.draw do
  get 'property_owner_dashboards/index'
  get 'user_dashboards/index'
  get 'bookinggs/index'
  get 'bookinggs/show'
  get 'bookinggs/create'
  get 'bookinggs/update'
  get 'bookinggs/edit'
  get 'bookinggs/new'
  get 'bookinggs/destroy'
  #get 'properties/index'
  #get 'properties/show'
  #get 'properties/new'
  #get 'properties/edit'
  #get 'properties/create'
  #get 'properties/update'
  #get 'properties/destroy'
  resources :properties
  devise_for :users
  get 'home/index'
    root to: "home#index"
    #devise_for :users,
     #      :controllers  => {
      #       :registrations => 'mydevise/registrations'
       #    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
