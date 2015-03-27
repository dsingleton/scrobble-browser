Rails.application.routes.draw do

  concern :users      do resources :users,     only: [:index] end
  concern :artists    do resources :artists,   only: [:index] end
  concern :tracks     do resources :tracks,    only: [:index] end
  concern :scrobbles  do resources :scrobbles, only: [:index] end

  resources :users, only: [:index, :show], concerns: [:scrobbles, :artists, :tracks]

  constraints(id: /.+/) do
    resources :artists, only: [:index, :show], concerns: [:scrobbles, :users] do
      resources :tracks, only: [:index, :show], concerns: [:scrobbles, :users]
    end
  end

  resources :tracks, only: [:index]

  resources :scrobbles, only: [:index]

  root 'home#index'
end
