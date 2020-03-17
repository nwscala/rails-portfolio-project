Rails.application.routes.draw do
  resources :sightings
  resources :birds
  resources :birdwatchers
  root to: 'static#home'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get 'github_edit', to: 'birdwatchers#github_edit', as: 'github_edit'
  match '/auth/:provider/callback', to: 'sessions#github', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
