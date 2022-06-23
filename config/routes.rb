Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/', to: "users#index"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :destroy], param: :post_id 
  end

  resources :posts, only: [:show], param: :post_id 
  resources :posts, only: [], param: :post_id do
    member do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
