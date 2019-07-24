class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :all_posts, :new, :create, :show, :edit, :update, :delete, :destroy]
  before_action :set_post, only: [:show]
  before_action :set_post_private, only: [:edit, :update, :delete, :destroy]
  
  def index
    @posts = current_user.posts
  end

  def all_posts
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        # format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def delete
  end

  def update
    @post.update(post_params)
      
    redirect_to @post
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end


  private
  
  def set_post
    @post = Post.find(params[:id])
  end

  def set_post_private
    @post = current_user.posts.find_by(id: params[:id])
    if @post  
    else
      respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Not Allowed' }
      end
    end 
  end

  def post_params
    params.require(:post).permit(:image, :caption, :user)
  end
end
