Rails.application.routes.draw do
  get 'avatars/create'
  root to: 'events#index'

  devise_for :users
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  
  
  resources :events
  resources :events do
    resources :attendances
  end
  
  
end
