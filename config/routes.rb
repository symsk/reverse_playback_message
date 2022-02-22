Rails.application.routes.draw do
  root to: 'home#index'
  resources :messages, param: :uuid
  resources :quizzes
  # namespace :api do
  #   resources :messages
  # end
  # get '*path', to: 'home#index'
end
