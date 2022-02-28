Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # get '/discover', to: 'search#index'
  get '/discover/', to: 'books#index'

  resources :books
  get '/auth/google_oauth2/callback', to: 'users#create'
end
