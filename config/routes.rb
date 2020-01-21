Rails.application.routes.draw do
  # get 'users/new'
  root 'questions#index'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
  resources :questions do
    resources :answers
  end
end
