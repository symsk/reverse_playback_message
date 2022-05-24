Rails.application.routes.draw do
  resources :messages, param: :uuid, only: %i[show new create]
  resources :quizzes, only: %i[index show new create]
  resources :users, only: %i[new create]

  root to: "static_pages#top"
  get "privacy", to: "static_pages#privacy"
  get "terms", to: "static_pages#terms"
  get "guide", to: "static_pages#guide"
  get "message_sample", to: "static_pages#message_sample"

  get "/login", to: "user_sessions#new"
  post "/login", to: "user_sessions#create"
  post "/logout", to: "user_sessions#destroy"

  get "/sitemap", to: redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV["S3_BUCKET_KEY"]}/sitemaps/sitemap.xml.gz")
  get "*path", to: "static_pages#top"
end
