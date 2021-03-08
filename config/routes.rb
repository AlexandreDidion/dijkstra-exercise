Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get '/direction', to: 'graphs#direction', as: :direction
  get '/shortest_path', to: 'graphs#shortest_path', as: :shortest_path
end
