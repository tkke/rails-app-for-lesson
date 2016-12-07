Rails.application.routes.draw do
  devise_for :users

  get '/activities/index' => 'activities#index'
  get '/trends/index' => 'trends#index'

  resources :users, only: [:index, :edit, :update, :show] do
    resource :relationships, only: [:create, :destroy]
    get :favorites, on: :member
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end

  root 'tweets#index'
end
