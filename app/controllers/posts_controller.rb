class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    @current_user = @user
  end

  def show
    @post = Post.includes(:comments).find(params[:post_id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])

    new_post = @user.posts.new(post_params)
    new_post.Likes_Counter = 0
    new_post.Comments_Counter = 0
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to user_posts_path(params[:user_id]), notice: 'Post was successfully created.'
        else
          render :new, alert: 'Error occurred, please try again. Post not saved'
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    user = User.find(post.AuthorId_id)
    user.Posts_Counter -= 1
    post.destroy
    user.save
    flash[:alert] = 'You have successfully deleted the post!'
    redirect_to user_posts_path(post.AuthorId_id)
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
