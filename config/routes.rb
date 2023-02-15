Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/home' , to: 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:name', to: 'welcome#show'
  get 'user/:id',  to: 'user#show'
  resources :gossips, only: [:new, :create, :update, :edit, :show, :destroy]
  resources :cities, only: [:show]
  root 'static_pages#home'
  resources :gossips do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
  
end
