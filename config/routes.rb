Rails.application.routes.draw do
  root "users#show"

  resources :users, only: :show
  devise_for :user
end
