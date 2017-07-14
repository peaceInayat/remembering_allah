Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :wisdoms do
    member do
      put "like",    to: "wisdoms#upvote"
    end
  end
  resources :testimonials
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
  get '/contact_us', to: 'home#contact_us'

end
