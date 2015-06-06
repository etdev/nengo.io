Rails.application.routes.draw do
  resource :nengos, only: [:index] do
    collection do
      post "update" => "nengos#update"
      post "edit" => "nengos#edit"
    end
  end
  resources :holidays, only: [:index]
  resource :app_download, only: [:show]
  get "about" => "nengos#about"
  root to: "nengos#index"
end
