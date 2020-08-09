class CommentsController < ApplicationController
	def create
		post = Post.find(params[:post_id])
		comment = current_user.comments.new(comment_params)
	    comment.post_id = post.id
	    comment.save
		redirect_to post_path(post)
	end

	def edit
		@post = Post.find(params[:post_id])
	end

	def update
		@post = Post.find(params[:post_id])
		
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render "edit"
		end
	end

	def destroy
		Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
		redirect_to post_path(params[:post_id])
	end

private
	def comment_params
		params.require(:comment).permit(:body)
	end
end
