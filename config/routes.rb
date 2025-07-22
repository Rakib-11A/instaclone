Rails.application.routes.draw do
  get "likes/create"
  get "likes/destroy"
  resources :likes, only: [:create, :destroy]
  
  devise_scope :user do
    get '/users', to: 'devise/registration#new'
    get '/users/password', to: 'devise/password#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  resources :users, only: [:show]
  get "home/about"
  get "posts/myposts"
  # get "posts/:id/liked_user", to: 'posts#liked_user', as: :liked_users

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :comments, except: [:create, :destroy]

  resources :likes, only: [:create, :destroy]
  root "posts#index"
end
