class CommentsController < ApplicationController
  before_action :require_user

  def create

    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @post = Post.find(params[:post_id])
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      flash[:notice] = "Your comment has been saved"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end

  def vote
   
    @comment= Comment.find(params[:id])
    Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    flash[:notice] = "Your vote has been recorded"
    redirect_to :back
  end
  
  private

  def comment_params

     params.require(:comment).permit(:body)

  end

end