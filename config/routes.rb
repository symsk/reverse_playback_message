Rails.application.routes.draw do
  root to: 'static_pages#top'

  resources :messages, param: :uuid, only: %i(show new create)
  resources :quizzes

  get 'privacy', to: 'static_pages#privacy'
  get 'terms', to: 'static_pages#terms'
  resource :contacts, only: %i(new create)
end
