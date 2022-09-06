Rails.application.routes.draw do
<<<<<<< HEAD
  resources :artist_profiles

=======
  get 'profile_selection/show'
>>>>>>> development
  get 'contact/show'
  get 'about/show'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
