Rails.application.routes.draw do

  get 'followings/create'
  get 'followings/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:index]
  root 'articles#index'
  resources :articles do
    collection do
      post :confirm
    end
  end

  resources :likes, only: [:create, :destroy]
  resources :stocks, only: [:index, :create, :destroy]
  resources :followings, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
