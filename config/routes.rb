Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :services
end

#root to: services/index
