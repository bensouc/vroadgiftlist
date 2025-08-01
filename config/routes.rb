Rails.application.routes.draw do
  root "pages#home"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :events, param: :invite_token, only: [] do
  member do
    get :join  # GET /events/:id/join
  end
  end
  resources :events, only: [ :index, :show, :new, :create, :destroy ] do
    resources :gifts, only: [ :new, :create ]
    resources :users, only: [] do
      resources :wishlists, only: [:index]
    end
  end
  resources :users, only: [] do
    resources :gifts, only: [ :index ]
  end
  resources :gifts, only: [ :index, :show, :edit, :update, :destroy, :new, :create ]
  resources :gift_wishlists, only: [ :create, :destroy ], path: "wishlists"
  resources :wishlists, only: [:update]
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
