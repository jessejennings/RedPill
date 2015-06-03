Rails.application.routes.draw do
  devise_for :users



  resources :users, only: [:show] do
    resources :registered_applications, only: [:new, :create]  
  end 



  get 'welcome/index'

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
