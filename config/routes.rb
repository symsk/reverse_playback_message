Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  root to: 'static_pages#top'

  resources :messages, param: :uuid, only: %i[show new create]
  resources :quizzes
  resources :users, only: %i[new create]

  get 'privacy', to: 'static_pages#privacy'
  get 'terms', to: 'static_pages#terms'
  get 'guide', to: 'static_pages#guide'
  get 'message_sample', to: 'static_pages#message_sample'

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  post '/logout', to: 'user_sessions#destroy'
  resources :password_resets
  get '*path', to: 'static_pages#top'
end
