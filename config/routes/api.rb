# frozen_string_literal: true

namespace :api, defaults: { format: :json } do
  namespace :v1 do
    # resources :users, only: [:show, :create, :update, :destroy], constraints: { id: /.*/ }
    resources :bookings, only: [:create, :update]
    resources :admin, only: :index

  end
end
