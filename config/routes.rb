Rails.application.routes.draw do
  resource :nengo, only: [:show]
  resource :age, only: [:show]
  resource :eto, only: [:show]
  resource :holidays, only: [:show]
  resource :app_downloads, only: [:show]
  root to: "nengo#show"
end
