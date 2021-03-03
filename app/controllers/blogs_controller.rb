class BlogsController < ApplicationController

  http_basic_authenticate_with name: "pkb", password: "secret", except: [:index, :show]

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
    @blog= Blog.new(blog_params)
    @blog.user = User.first
    if @blog.save
      flash[:notice] = "Your Blog Post has been successfully created." 
      redirect_to blog_path(@blog)
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end


  private def blog_params
    params.require(:blog).permit(:title, :content, :status)
  end

end
