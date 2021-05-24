Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'countries#index'
  resources :countries, only: [:index]
  resources :cities, only: [:index]
  resource :dijkstra, only: [:show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :countries, only: [:index, :show] do
        resources :cities, only: [:index]
      end
      resources :cities, only: [:index, :show]
      resources :dijkstras, only: [:create]
    end
  end
end
