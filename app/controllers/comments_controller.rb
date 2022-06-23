class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: comment_params[:Text], AuthorId_id: current_user.id, PostId_id: @post.id)

    if @comment.save
      redirect_to "/posts/#{@post.id}", notice: 'Comment Added!'
    else
      redirect_to "/posts/#{@post.id}", alert: 'Error occured, Comment Not Saved!'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @post.decrement!(:Comments_Counter)
    @comment.destroy!
    redirect_to "/posts/#{@post.id}", notice: 'Comment Deleted!'
  end

  private

  def comment_params
    params.permit(:Text, :post_id)
  end
end
