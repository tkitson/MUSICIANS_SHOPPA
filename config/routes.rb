Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :services do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :update]

  get "/my_services", to: "services#user_index"

end

#root to: services/index
