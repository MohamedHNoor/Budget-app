Rails.application.routes.draw do
  
  get "home/index"
  resources :entities
  resources :groups
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
  
    unauthenticated do
      root "home#index", as: :unauthenticated_root
    end
  end
end
