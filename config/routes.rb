Rails.application.routes.draw do
  devise_for :users
  get 'photographs/index'
  root to: "photographs#index"
  resources :photographs do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
