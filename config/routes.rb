Rails.application.routes.draw do
  root to: "welcome#show"
  resource :age, only: [:show]
  resource :eto, only: [:show]
  resource :holidays, only: [:show]
  resource :apps, only: [:show]
end
