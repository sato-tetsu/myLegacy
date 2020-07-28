Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'posts#index'

	resources :users
	resources :posts
	resources :likes
	resources :favorites
	resources :comments
	resources :relationships
	
end
