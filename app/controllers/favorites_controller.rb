class FavoritesController < ApplicationController

  def create
  	blog = Blog.find(params[:blog_id])
  	favorite = current_user.favorites.new(blog_id: blog.id)
  	favorite.save
  	redirect_to blog_path(blog)
  end

  def destroy
  	blog = Blog.find(params[:blog_id])
  	favorite = current_user.favorites.find_by(blog_id: params[:blog_id])
  	favorite.destroy
 	redirect_to blog_path(blog)
  end

  def create_favorite
  	blog = Blog.find(params[:blog_id])
  	favorite = current_user.favorites.new(blog_id: blog.id)
  	favorite.save

# 以下、renderを使用した記述
  	@user = blog.user
    @blogs = @user.blogs
    @blog = Blog.new
  	render "users/show"

  	# redirect_to user_path(blog.user)
  end

  def destroy_favorite
  	blog = Blog.find(params[:blog_id])
  	favorite = current_user.favorites.find_by(blog_id: params[:blog_id])
  	favorite.destroy

# 以下、renderを使用した記述
  	@user = blog.user
    @blogs = @user.blogs
    @blog = Blog.new
  	render "users/show"

  	# redirect_to user_path(blog.user)
  end
end
