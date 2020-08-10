class PostsController < ApplicationController


	def index
		@posts = Post.page(params[:page]).per(5)
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to posts_path
		else
			flash[:alert1] = @post.errors.full_messages
			render :new
		end
	end


	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			flash[:error] = @post.errors.full_messages
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

  private
    def post_params
      params.require(:post).permit(:body, :opinion, :posts_image)
    end
end
