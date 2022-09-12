Rails.application.routes.draw do
  get 'applications/new'
  get 'applications/create'
  get 'applications/update'
  resources :venue_profiles do
    resources :venuepicts, only: [:create]
  end
  resources :artist_profiles do
    resources :artistpicts, only: [:create]
  end
  resources :performances
  resources :artist_genres, only: %i[new create destroy]
  resources :dashboards, only: [:show]

  get 'profile_selection/show'
  get 'contact/show'
  get 'about/show'
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
