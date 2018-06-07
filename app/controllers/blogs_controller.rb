class BlogsController < ApplicationController
  def top
  end

  def index
  	@blogs = Blog.all
  	@blog = Blog.new
  end

  def show
  	@blog = Blog.find(params[:id])
  end

  def create
  	@blog = Blog.new(blog_params)
  	if @blog.save
  		flash[:notice] = "Book was succesfully added！"
	  	redirect_to blog_path(@blog.id)
  	else
  		@blogs = Blog.all
  		render action: :index
  	end
  end

  def edit
  	@blog = Blog.find(params[:id])
  end

  def update
  	blog = Blog.find(params[:id])
  	if blog.update(blog_params)
  		flash[:notice] = "Book was succesfully updated！"
  		redirect_to blog_path(blog.id)
  	else
  		render action: :edit
  	end
  end

  def destroy
  	blog = Blog.find(params[:id])
  	blog.destroy
  	flash[:notice] = "Book was succesfully destroied!"
#一覧画面に戻る
  	redirect_to blogs_path
  end


  	private
  	def blog_params
  		params.require(:blog).permit(:title, :body)
  	end
end
