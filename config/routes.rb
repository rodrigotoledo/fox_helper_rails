Rails.application.routes.draw do
  resources :patients
  namespace :api do
    resources :patients
    post "sign-up", to: "registrations#create", as: :sign_up
    post "sign-in", to: "sessions#create", as: :sign_in
    delete "sign-out", to: "sessions#destroy", as: :sign_out
  end
  get "home", to: "home#index", as: :home
  resource :registrations, only: %i[create new]
  resource :session
  resources :passwords, param: :token
  root "protected#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
