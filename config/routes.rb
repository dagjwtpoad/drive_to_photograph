Rails.application.routes.draw do
  devise_for :users
  get 'photographs/index'
  root to: "photographs#index"
  resources :photographs
end
