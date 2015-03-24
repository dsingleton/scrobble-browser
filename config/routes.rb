Rails.application.routes.draw do

  concern :scrobble_list do
    resources :scrobbles, only: [:index]
  end
  concern :user_list do
    resources :users, only: [:index]
  end
  concern :artist_list do
    resources :artists, only: [:index]
  end
  concern :track_list do
    resources :tracks, only: [:index]
  end

  resources :scrobbles, only: [:index, :show]
  resources :users, only: [:index, :show], concerns: [:scrobble_list, :artist_list, :track_list]

  constraints(id: /.+/) do
    resources :artists, only: [:index, :show], concerns: [:scrobble_list, :user_list] do
      resources :tracks, only: [:index, :show], concerns: [:scrobble_list, :user_list]
    end
  end

  root 'home#index'
end
