class PostsController < ApplicationController
  def index
    @posts = Post.most_recent_first.first(5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(params[:post].permit(:title, :subtitle, :body))

    redirect_to @post
  end
end
