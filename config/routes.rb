Rails.application.routes.draw do

  resources :users, only: [:index, :show] do
    resources :scrobbles, only: [:index]
    resources :artists, only: [:index]
    resources :tracks, only: [:index]
  end

  constraints(id: /.+/) do
    resources :artists, only: [:index, :show] do
      resources :users, only: [:index]
      resources :scrobbles, only: [:index]

      resources :tracks, only: [:index, :show] do
        resources :users, only: [:index]
        resources :scrobbles, only: [:index]
      end
    end
  end

  resources :tracks, only: [:index]

  resources :scrobbles, only: [:index]

  root 'home#index'
end
