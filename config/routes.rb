Rails.application.routes.draw do
  root to: "welcome#index", via: :get

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users
  resources :profiles
  get '/profiles' => 'profiles#index'

end
