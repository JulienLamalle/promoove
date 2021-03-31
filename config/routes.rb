Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users, skip: [:session, :password, :registration], :controllers => { omniauth_callbacks: "callbacks"}

  localized do
    devise_for :users, skip: :omniauth_callbacks
    resources :about, only: [:index]
    resources :projects do 
      resources :comment_upvotes
    end
    resources :categories
    resources :terms, only: [:index]
    resources :users, only: [:show]
    resources :comments
    resources :comment_answers
    resources :about, only: [:index]
    resources :languages, only: [:index, :show]
    resources :admin, only: [:index]
    namespace :admin do 
      resources :projects, only: [:index]
      resources :users, except: [:show, :create]
      resources :donations, only: [:index]
    end
  end
  
end
