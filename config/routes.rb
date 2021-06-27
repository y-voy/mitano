Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    collection do
      post :confirm
    end
  end

end
