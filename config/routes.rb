# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  # resources :users
  devise_for :users, defaults: { format: :json }, controllers: {
    registrations: 'users/registrations'
  }
  namespace :api do
    namespace :v1 do
      # our apis will come under here
    end
  end
end
