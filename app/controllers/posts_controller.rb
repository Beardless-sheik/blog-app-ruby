class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @current_user = @user
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
    puts @post.Comments_Counter
  end

  def create
    @user = User.find(params[:user_id])

    new_post = @user.posts.new(post_params)
    new_post.Likes_Counter = 0
    new_post.Comments_Counter = 0
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to post_path(params[:user_id]), notice: 'Post was successfully created.'
        else
          render :new, alert: 'Error occurred, please try again. Post not saved'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
end
