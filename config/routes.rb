Rails.application.routes.draw do
  resources :accounts do
    resources :addresses
  end
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :archive, :unarchive
    end
  end
  resources :account_activations, only: [:edit, :update]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
