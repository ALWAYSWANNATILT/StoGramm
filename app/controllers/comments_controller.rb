class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :content)
  end
end
