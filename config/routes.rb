Rails.application.routes.draw do
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'

  resources :articles, only: %i[index show create destroy update]
  get '/index', to: 'articles#index'
end
