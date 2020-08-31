Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root "items#index"
  resources :users, only: [:show, :update]
  resources :items do
    resources :transactions,  only: [:index, :create]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
