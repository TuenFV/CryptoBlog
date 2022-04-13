Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/okay/admin', as: 'rails_admin'
  devise_for :users
  resources :pools do
    resources :vestings
  end
  root 'home#index'
  get '/prices', to: "home#prices"
  post '/prices', to: "home#prices"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
