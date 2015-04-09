Rails.application.routes.draw do
  resource :nengo, only: [:index]
  resource :age, only: [:show]
  resource :eto, only: [:show]
  resources :holidays, only: [:index]
  resource :app_download, only: [:show]
  root to: "nengos#index"
end
