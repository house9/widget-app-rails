require 'sidekiq/web'

Rails.application.routes.draw do
  resources :widgets do
    member do
      post :restock
    end
  end

  # mount Sidekiq::Web in your Rails app
  mount Sidekiq::Web => "/sidekiq"

  scope :api, constraints: { format: 'json' }, defaults: { format: 'json' } do
    get '/widgets', to: 'widgets#index'
  end

  get 'home', to: 'home#index'
  root "home#index"
end
