require 'sidekiq/web'

Rails.application.routes.draw do
  resources :widgets do
    member do
      post :restock
    end
  end

  # mount Sidekiq::Web in your Rails app
  mount Sidekiq::Web => "/sidekiq"

  # client react app proxying /api requests to rails server
  scope :api, constraints: { format: 'json' }, defaults: { format: 'json' } do
    get '/widgets', to: 'widgets#index'
  end

  get 'home', to: 'home#index'
  get 'home/hello_htmx', to: 'home#hello_htmx'

  root "home#index"
end
