require 'sidekiq/web'

Rails.application.routes.draw do
  resources :widgets do
    member do
      post :restock
    end
  end

  # mount Sidekiq::Web in your Rails app
  mount Sidekiq::Web => "/sidekiq"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
