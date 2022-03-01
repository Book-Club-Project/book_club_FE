Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/books/:id', to: "books#show"
  # get '/discover', to: 'books#index'

  get '/auth/google_oauth2', to: 'sessions#create'
  get '/auth/google_oauth2/callback', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'
end
