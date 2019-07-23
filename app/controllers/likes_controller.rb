class LikesController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy, :create]
  before_action :find_like, only: [:destroy]

  def index
    @posts = []
    @likes = current_user.likes
     @likes.each do |l| 
      @posts.push(Post.find(l.post_id))
       end 
  end

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
 end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

end
