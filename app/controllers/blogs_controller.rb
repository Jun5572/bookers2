class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :show]
  # before_action :authenuser, only: [:show]


  def top
  end

  def index
  	@blogs = Blog.all
  	@blog = Blog.new
    @user = current_user
  end

  def show
    @blog_new = Blog.new
    if Blog.exists?(id: params[:id])
      @blog = Blog.find(params[:id])
      @user = @blog.user
    elsif 
      flash[:notice] = "NOT exist book!"
      redirect_to blogs_path
    end
  	
  end

  def create
  	@blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
  	if @blog.save
  		flash[:notice] = "Book was successfully added！"
	  	redirect_to blog_path(@blog.id)
  	else
  		@blogs = Blog.all
      # flash[:notice] = "ようこそ。本日は#{Date.today}です。"
      flash[:remain] = "Blank error!"
      flash[:remain2] = "Please enter Title & Opinion."
      redirect_to user_path(current_user.id)
      # render action: :index
      # render action: :index, partial: "list", locals: { user: @user, blog,@blog }
  	end
  end

  def edit
  	@blog = Blog.find(params[:id])
    if @blog.user != current_user
        flash[:notice2] = "not accepted!"
        redirect_to users_path
    end
  end

  def update
  	blog = Blog.find(params[:id])
  	if blog.update(blog_params)
  		flash[:notice] = "Book was successfully updated！"
  		redirect_to blog_path(blog.id)
  	else
  		render action: :edit
  	end
  end

  def destroy
  	blog = Blog.find(params[:id])
  	blog.destroy
  	flash[:destroy] = "Book was successfully destroied!"
    user = current_user
#一覧画面に戻る
  	redirect_to user_path(user.id)
  end


  	private
  	def blog_params
  		params.require(:blog).permit(:title, :body)
  	end
end
