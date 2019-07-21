class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :delete]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def delete
  end
end
