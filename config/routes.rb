Rails.application.routes.draw do
  devise_for :user, only: []

  resources 'applications', only: [:create, :destroy, :index, :show]
  resources 'responses', only: [:create]

  namespace :v1, defaults: { format: :json } do
  	resources :users, only: [:create]
    resource :login, only: [:create], controller: :sessions
  end
end
