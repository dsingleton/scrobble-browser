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
  get 'charts/user' => 'charts#user'

  constraints(id: /.+/) do
    resources :artists, only: [:index, :show] do
      resources :tracks, only: [:index, :show] do
        member do
          get 'users' => 'charts#user', type: 'track'
        end
      end

      # Has to go track routes, so they get higher precidence
      member do
        get 'users' => 'charts#user', type: 'artist'
        get 'track-chart' => 'charts#track', type: 'artist'
      end
    end
  end

  root 'home#index'
end
