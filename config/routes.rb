Rails.application.routes.draw do
  resources :nengos, only: [:show, :index]
  resources :ages, only: [:show, :index]
  resources :etos, only: [:show, :index]
  resources :holidays, only: [:show, :index]
  resources :app_downloads, only: [:show, :index]
  root to: "nengos#index"
end
