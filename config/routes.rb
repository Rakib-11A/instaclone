Rails.application.routes.draw do
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
  get "posts/:id/liked_user", to: 'posts#liked_user', as: :liked_users

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :comments, except: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "posts#index"
end
