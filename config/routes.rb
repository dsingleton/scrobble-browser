Rails.application.routes.draw do

  resources :scrobbles, only: [:index, :show]

  resources :users, only: [:index, :show]

  get 'charts/artist' => 'charts#artist'
  get 'charts/track' => 'charts#track'

  constraints(id: /[^\/]+/) do
    resources :artists, only: [:index, :show] do
      resources :tracks, only: [:index, :show]
    end
  end

  root 'home#index'
end
