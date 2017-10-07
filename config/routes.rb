Rails.application.routes.draw do
  resources :miscs
  resources :publications
  resources :galleries
  resources :core_articles do
    member do
      put "like",    to: "wisdoms#upvote"
    end
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

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

  root 'home#welcome'
  get '/who_we_are', to: 'home#who_we_are'
  get '/contact_us', to: 'home#contact_us'
  get '/manage_users', to: 'home#manage_users'
  get '/update_users', to: 'home#update_users'

  get '/manage_boq_highlights', to: 'home#manage_boq_highlights'
  get '/manage_post_highlights', to: 'home#manage_post_highlights'
  get '/manage_video_highlights', to: 'home#manage_video_highlights'
  get '/manage_wisdom_highlights', to: 'home#manage_wisdom_highlights'

  get '/update_highlights', to: 'home#update_highlights'

  resources :pics

end
