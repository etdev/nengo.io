Rails.application.routes.draw do
  resource :nengos, only: [:index, :update, :edit]
  resources :holidays, only: [:index]
  resource :app_download, only: [:show]
  root to: "nengos#index"
end
