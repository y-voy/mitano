Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:index] do
    resources :articles, only: [:index], controller: 'users/articles'
  end
  devise_scope :user do
   post 'users/guest_sign_in', to: 'users/sessions#new_guest'
   post 'users/guest_admin_sign_in', to: 'users/sessions#new_admin_guest'
  end
  resources :users, only: [:index] do
    resource :followings, only: [:create, :destroy]
  end
  root 'articles#index'
  resources :articles do
    collection do
      post :confirm
    end
    resources :comments, only: [:create, :destroy]
  end

  resources :tags, only: [:index] do
    resources :articles, only: [:index], controller: 'tags/articles'
  end
  resources :impressions, only: [:index]
  resources :likes, only: [:index, :create, :destroy]
  resources :stocks, only: [:index, :create, :destroy]
  resources :followings, only: [:index, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
