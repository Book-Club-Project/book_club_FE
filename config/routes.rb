Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get   '/discover', to: 'books#index'
  resources :books
  resources :comments, only: [:create]

  resources :clubs, only: [:show, :create, :new] do
    resources :users #only: [:index], controller: 'club_users'
    resources :comments # only: [:index], controller: 'club_comments'
  end


  get   '/register', to: 'users#new'
  post  '/register', to: 'users#create'

  get   '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  get   '/logout', to: 'sessions#destroy'

  get   '/auth/google_oauth2/callback', to: 'users#create'
end
