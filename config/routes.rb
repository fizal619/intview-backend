Rails.application.routes.draw do
  devise_for :user, only: []

  namespace :v1, defaults: { format: :json } do
  	resources :users, only: [:create]
    resource :login, only: [:create], controller: :sessions
  end
end
