class BlogController < ApplicationController

  before_filter :find_post, :except => [:index, :new, :create]

  def index
    @posts = Post.order('created_at DESC').all
  end

  def show; end

  def edit; end

  def update
    @post.update_attributes(params[:post])
    flash[:notice] = "Blog Post updated"
    redirect_to blog_path(@post)
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(params[:post])
      flash[:notice] = "Blog Post created"
      redirect_to blog_path(@post)
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

end
