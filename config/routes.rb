Rails.application.routes.draw do
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
  get '/contact_us', to: 'home#contact_us'
  get '/core_articles', to: 'home#core_articles'
  resources :pics

end
