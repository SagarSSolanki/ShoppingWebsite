Rails.application.routes.draw do
  root "registrations#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  resources :addresses, only: %i(create edit update index destroy)

  resources :products, only: %i(index show edit update new create destroy)

  resources :carts, only: %i(index)

  resources :cartitems, only: %i(update create destroy)
end
