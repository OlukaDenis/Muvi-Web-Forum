Rails.application.routes.draw do
  root 'questions#index', as: 'home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  resources :questions
end
