Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/books/:id', to: "books#show"
  # get '/discover', to: 'books#index'
  resources :clubs, only: [:show, :create] do
    resources :users, only: [:index], controller: 'club_users'
    resources :comments, only: [:index], controller: 'club_comments'
  end
  
  get '/auth/google_oauth2/callback', to: 'users#create'
end
