Rails.application.routes.draw do
  devise_for :users



  resources :users, only: [:show] do
    resources :registered_applications, only: [:new, :create, :show, :edit] 
  end
  
  namespace :api, defaults: { format: :json } do
    resources :events, only: [:create]
  end 



  get 'welcome/index'

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
