class BlogsController < ApplicationController
  def index
    @blogs = Blog.includes(:user).order("id DESC").page(params[:page]).per(4)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(title: blog_params[:title],body: blog_params[:body],image: blog_params[:image],user_id: current_user.id)
    redirect_to action: "index"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(title: blog_params[:title],body: blog_params[:body],image: blog_params[:image],user_id: current_user.id)
    redirect_to action: "index"
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to action: "index"
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :image)
  end


end
