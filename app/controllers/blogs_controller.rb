class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to action: "index"
  end


  def move_to_index
    redirect_to action: "index" unless user_signed_in?
  end

  private
  def blog_params
    binding.pry
    params.permit(:title, :body)
  end
end
