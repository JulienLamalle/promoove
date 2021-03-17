Rails.application.routes.draw do

  root 'projects#index'
  devise_for :users, skip: [:session, :password, :registration], :controllers => { omniauth_callbacks: "callbacks"}

  localized do
    devise_for :users, skip: :omniauth_callbacks
    devise_for :admins
    resources :projects
    resources :categories
    resources :terms, only: [:index]
    resources :users, only: [:show]
  end
  
end
