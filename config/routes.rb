Rails.application.routes.draw do
  resources :sightings, only: [:index]
  resources :birds
  resources :birdwatchers do 
    resources :sightings
  end
  root to: 'static#home'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  match '/auth/:provider/callback', to: 'sessions#github', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
