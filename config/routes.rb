Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    get :favorites, on: :member
  end
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end

  root 'tweets#index'
end
