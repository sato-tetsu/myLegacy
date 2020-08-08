Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'posts#index'
	get "/homes/about" => "homes#about"
	get "favorites", to: "favorites#index"

	resources :users
	resources :posts do
		resource :likes, only: [:create, :destroy]
		resource :favorites, only: [:create, :destroy]
		resources :comments, only: [:create, :destroy, :edit]
	end
	resources :relationships, only: [:create, :destroy]
	
end
