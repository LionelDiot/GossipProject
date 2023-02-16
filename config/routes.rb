Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/home' , to: 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  resources :gossips, only: [:new, :create, :update, :edit, :show, :destroy]
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  root 'static_pages#home'
  resources :gossips do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :gossips do
    resources :likes, only: [:new, :create, :destroy]
  end
  resources :users, only: [:new, :create, :edit, :update, :show]
end
