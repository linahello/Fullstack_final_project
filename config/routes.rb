Rails.application.routes.draw do
  resources :venue_profiles do
    resources :venuepicts, only: [:create]
  end
  resources :artist_profiles do
    resources :artistpicts, only: [:create]
  end
  resources :performances
  resources :artist_genres, only: %i[new create destroy]

  get 'profile_selection/show'
  get 'contact/show'
  get 'about/show'
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
