class CommentsController < ApplicationController

  def create

    @comment = Comment.new(comment_params)
    @comment.user = User.first
    @post = Post.find(params[:post_id])
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      flash[:notice] = "Your comment has been saved"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end

  def comment_params

     params.require(:comment).permit(:body)

  end

end