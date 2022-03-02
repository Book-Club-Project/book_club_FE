Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get   '/discover', to: 'books#index'
  resources :books

  resources :clubs, only: [:show, :create] do
    resources :users, only: [:index], controller: 'club_users'
    resources :comments, only: [:index], controller: 'club_comments'
  end

  get   '/register', to: 'users#new'
  post  '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'
  resources :users, only: [:create]
  
  get   '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  get   '/logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  get   '/auth/google_oauth2/callback', to: 'users#create'
end
