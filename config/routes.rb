Rails.application.routes.draw do
  resources :categories
  resources :videos
  resources :posts do
    resources :comments
    member do
      put "like",    to: "posts#upvote"
    end
  end
  resources :videos do
    resources :comments
    member do
      put "like",    to: "videos#upvote"
    end
  end
  devise_for :users
  root 'home#welcome'
  # post '/video_categories', to: 'home#create_video_category'
  get '/testimonials', to: 'home#testimonials'
  get '/contact_us', to: 'home#contact_us'

end
