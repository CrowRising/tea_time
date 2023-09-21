# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customer_subscriptions, only: [:create]
      patch '/customer_subscriptions', to: 'customer_subscriptions#update'
      get '/customers', to: 'customers#show'
    end
  end
end
