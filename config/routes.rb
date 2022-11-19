Rails.application.routes.draw do
  root "users#show"

  resources :users, only: :show do
    resources :skill_sets
    resource :profile
  end
  devise_for :user
end
