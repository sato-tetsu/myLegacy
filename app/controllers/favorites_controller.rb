class FavoritesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		like = current_user.favorites.new(post_id: @post.id)
		like.save
	end

	def destroy
		@post = Post.find(params[:post_id])
		like = current_user.favorites.find_by(post_id: @post.id)
		like.destroy
	end

	def index
		@posts = current_user.favorite_posts.page(params[:page]).per(5)
	end

end
