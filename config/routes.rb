Rails.application.routes.draw do

  get 'favorites/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'

  resources :products, only: [:index, :show] do
  	resources :reviews, only: [:create, :update, :destroy]
    resources :favorites, only: [:index, :create, :destroy]
  end

  resources :users, only: [:show, :edit, :update] do
	  resources :reviews, only: [:edit, :update, :destroy]
  end

end
