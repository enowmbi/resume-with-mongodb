Rails.application.routes.draw do
  root "users#show"

  resources :users, only: :show do
    resources :skill_sets
  end
  devise_for :user
end
