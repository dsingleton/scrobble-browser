Rails.application.routes.draw do

  resources :scrobbles, only: [:index, :show]

  resources :users, only: [:index, :show]

  get 'charts/artist' => 'charts#artist'
  get 'charts/track' => 'charts#track'

  resources :artists, only: [:index, :show] do
    resources :tracks, only: [:index, :show]
  end

  root 'home#index'
end
