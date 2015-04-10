Rails.application.routes.draw do
  resources :likes
  root to: "statics#signup"
  resources :users
  resources :events
  resources :clubs
  resources :cities
end
