Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :update, :index]

  resources :applications, only: [:show, :index]



  get 'welcome/index'

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
