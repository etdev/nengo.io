Rails.application.routes.draw do
  resources :nengos, only: [:index]
  resources :holidays, only: [:index]
  resource :app_download, only: [:show]
  root to: "nengos#index"
end
