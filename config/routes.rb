Rails.application.routes.draw do
  resources :sightings
  resources :birds
  resources :birdwatchers
  # get 'static/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
