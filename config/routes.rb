Rails.application.routes.draw do
  root to: 'static_pages#top'

  resources :messages, param: :uuid, only: %i[show new create]
  resources :quizzes

  get 'privacy', to: 'static_pages#privacy'
  get 'terms', to: 'static_pages#terms'
  # resources :users, only: %i[new create]

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  post '/logout', to: 'user_sessions#destroy'
  resources :password_resets
  get '*path', to: 'static_pages#top'

end
