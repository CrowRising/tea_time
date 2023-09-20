Rails.application.routes.draw do
  resources :customer_subscriptions
  resources :tea_subscriptions
  resources :subscriptions
  resources :customers
  resources :teas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
