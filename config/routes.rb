require 'sidekiq/web'

Rails.application.routes.draw do
  resources :widgets do
    member do
      post :restock
    end
  end

  # mount Sidekiq::Web in your Rails app
  mount Sidekiq::Web => "/sidekiq"

  get 'home', to: 'home#index'
  root "home#index"
end
