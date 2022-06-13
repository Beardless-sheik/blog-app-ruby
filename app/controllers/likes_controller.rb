class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(AuthorId_id: current_user.id, PostId_id: @post.id)

    if @like.save
      flash[:notice] = 'Like created succsefully'
      redirect_to "/posts/#{@post.id}", notice: 'Like Added!'
    else
      flash[:alert] = 'Liking failed.'
      redirect_to "/posts/#{@post.id}", alert: 'Error occured, Like Not Saved!'
    end
  end
end
