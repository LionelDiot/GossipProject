Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/home' , to: 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get '/welcome/:name', to: 'welcome#show'
  get 'gossip/:id', to: 'gossip#show'
  get 'user/:id',  to: 'user#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
