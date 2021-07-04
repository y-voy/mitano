Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'articles#index'
  resources :articles do
    collection do
      post :confirm
    end
  end

  resources :likes, only: [:create, :destroy]
  resources :stocks, only: [:index, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
