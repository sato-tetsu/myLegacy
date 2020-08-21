Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'posts#index'
	get "/homes/about" => "homes#about"
	get "favorites", to: "favorites#index"
	get "ranking", to: "posts#ranking"
	get "about_ranking", to: "homes#ranking"

	resources :users
	resources :posts do
		resource :likes, only: [:create, :destroy]
		resource :favorites, only: [:create, :destroy]
		resources :comments, only: [:create, :destroy]
	end

	post 'create/:id' => 'relationships#create', as: 'create' # フォローする
	post 'destroy/:id' => 'relationships#destroy', as: 'destroy' # フォロー外す

	get 'users/:id/follow' => 'users#followed'
	get 'users/:id/follower' => 'users#follower'


end
