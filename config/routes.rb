Rails.application.routes.draw do
  root to: 'events#index'

  devise_for :users
  get 'users/:id' => 'users#show', as: :user
  
end
