Rails.application.routes.draw do
  root to: 'home#index'
  namespace :api do
    resources :messages
    # resources :messages, param: :uuid
  end
  get '*path', to: 'home#index'
end
