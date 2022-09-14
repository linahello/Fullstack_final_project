Rails.application.routes.draw do
  resources :venue_profiles do
    resources :venuepicts, only: [:create]
  end
  resources :artist_profiles do
    resources :artistpicts, only: [:create]
  end
  resources :performances do
    resources :performance_genres, only: %i[new create destroy]
    resources :applications, only: %i[new create update show]
  end
  resources :artist_genres, only: %i[new create destroy]
  resources :dashboards, only: [:show]
  resources :conversations do
    resources :messages
  end

  get 'profile_selection/show'
  get 'contact/show'
  get 'about/show'
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
