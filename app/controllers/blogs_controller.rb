class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @blogs = Blog.all
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

  def move_to_index
    redirect_to action: "index" unless user_signed_in?
  end

end
