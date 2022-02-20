Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api do
    resources :messages
  end
  get '*path', to: 'home#index'
end
