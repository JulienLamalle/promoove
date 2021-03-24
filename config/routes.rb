Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users, skip: [:session, :password, :registration], :controllers => { omniauth_callbacks: "callbacks"}

  localized do
    devise_for :users, skip: :omniauth_callbacks
      resources :projects
    resources :categories
    resources :terms, only: [:index]
    resources :users, only: [:show]
    resources :comments
    resources :languages, only: [:index, :show]
    resources :admins, only: [:index]
    namespace :admin do 

    end
  end
  
end
