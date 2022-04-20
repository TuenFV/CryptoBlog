Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/okay/admin', as: 'rails_admin'
  devise_for :users
  resources :pools do
    resources :vestings
  end
  root 'home#index'
  get '/prices', to: "home#prices"
  post '/prices', to: "home#prices"

  get '/pricesmodel', to: "prices#index"
  post '/pricesmodel', to: "prices#update"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
