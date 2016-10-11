Rails.application.routes.draw do
  resources :statuses do
    resources :comments
  end

  resources :users 
  resources :friends
  get 'sessions' => 'sessions#create', as: :create

  get 'sessions/destroy'

  get 'login' => 'sessions#new'

  get 'logout' => 'sessions#destroy'

  get 'info' => 'users#show'


  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact
  get 'register' => 'users#new', as: :register
  root 'statuses#new'
  
  resources :sessions, only: [:new, :create, :destroy]
end
