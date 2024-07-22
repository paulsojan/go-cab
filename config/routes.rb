# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: :create, constraints: { id: /.*/ }
      resources :bookings, only: [:create, :update]
      resources :admin, only: :index
    end
  end

  root "home#index"
  get "*path", to: "home#index", via: :all
end
