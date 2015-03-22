Rails.application.routes.draw do

  resources :scrobbles, only: [:index, :show]

  resources :users, only: [:index, :show] do
    resources :scrobbles, only: [:index]
    member do
      get 'artists' => 'charts#artist'
      get 'tracks' => 'charts#track'
    end
  end

  get 'charts/artist' => 'charts#artist'
  get 'charts/track' => 'charts#track'

  constraints(id: /.+/) do
    resources :artists, only: [:index, :show] do
      resources :tracks, only: [:index, :show]
    end
  end

  root 'home#index'
end
