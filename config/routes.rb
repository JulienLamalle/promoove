Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'projects#index'
  resources :projects
  resources :categories
  resources :terms, only: [:index]
  resources :users, only: [:show]
end
