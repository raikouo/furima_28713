Rails.application.routes.draw do
  get 'cards/new'
  get 'users/show'
  devise_for :users,  controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root "items#index"
  resources :users, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :items do
    resources :transactions,  only: [:index, :create]
    resources :comments, only: :create
    collection do
      get 'search'
      get 'tag_search'
    end
  end
end
