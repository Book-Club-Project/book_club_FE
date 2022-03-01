Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'welcome#index'

  get   '/discover', to: 'books#index'
  resources :books

  get   '/register', to: 'users#new'
  post  '/register', to: 'users#create'

  get   '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  get   '/logout', to: 'sessions#delete'

  get   '/auth/google_oauth2/callback', to: 'users#create'
 
end
