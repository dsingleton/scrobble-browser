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
        resources :scrobbles, only: [:index]
        member do
          get 'users' => 'charts#user', type: 'track'
        end
      end

      # Has to go after track routes, so they get higher precidence
      resources :scrobbles, only: [:index]
      member do
        get 'users' => 'charts#user', type: 'artist'
        get 'tracks2' => 'charts#track', type: 'artist'
      end
    end
  end

  root 'home#index'
end
