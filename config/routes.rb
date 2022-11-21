Rails.application.routes.draw do
  root "users#show"

  resources :users, only: :show do
    resources :skill_sets
    resources :profiles, only: %I[create update]
    resources :experiences, only: %I[create update destroy]
  end
  devise_for :user
end
