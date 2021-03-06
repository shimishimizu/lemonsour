Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'

  resources :products, only: [:index, :show] do
  	resources :reviews, only: [:create, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
    resources :users, only: [:index]
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show, :edit, :update] do
	  resources :reviews, only: [:edit, :update, :destroy]
    resources :favorites, only: [:index]
    collection do
      get 'about'
    end
  end

  resources :informations, only: [:index, :show]

  get 'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'

end
