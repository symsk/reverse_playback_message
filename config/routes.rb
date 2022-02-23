Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :messages, param: :uuid
  resources :quizzes
end
