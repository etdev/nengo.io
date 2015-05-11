Rails.application.routes.draw do
  resource :nengos, only: [:index, :edit] do
    collection do
      post "update" => "nengos#update"
    end
  end
  resources :holidays, only: [:index]
  resource :app_download, only: [:show]
  root to: "nengos#index"
end
