class FavoritesController < ApplicationController

# Ajax対応のアクション記述
 before_action :set_variables
# ===============================以下削除厳禁=================================
  # def create
  # 	blog = Blog.find(params[:blog_id])
  # 	favorite = current_user.favorites.new(blog_id: blog.id)
  # 	favorite.save
  # 	redirect_to blog_path(blog)
  # end

  # def destroy
  # 	blog = Blog.find(params[:blog_id])
  # 	favorite = current_user.favorites.find_by(blog_id: params[:blog_id])
  # 	favorite.destroy
 	#   redirect_to blog_path(blog)
  # end
# ==========================================================================

def create

  favorite = Favorite.new(blog_id: @blog.id, user_id: current_user.id)
 
  favorite.save
  # @favorite = Favorite.create(user_id: current_user.id, blog_id: params[:blog_id])
  @favorites = Favorite.where(blog_id: params[:blog_id])
  # @blogs = Blog.all
end

def destroy
  favorite = Favorite.find_by(blog_id: @blog.id, user_id: current_user.id)
  favorite.destroy
  # favorite = Favorite.find_by(user_id: current_user.id, blog_id: params[:blog_id])
  # favorite.destroy
  @favorites = Favorite.where(blog_id: params[:blog_id])
  # @blogs = Blog.all
end

# ================================以下削除厳禁======================================
# ----------------------------Ajax対応する前に機能していた記述-----------------------
#   def create_favorite
#   	blog = Blog.find(params[:blog_id])
#   	favorite = current_user.favorites.new(blog_id: blog.id)
#   	favorite.save

# # 以下、renderを使用した記述
#   	@user = blog.user
#     @blogs = @user.blogs
#     @blog = Blog.new
#   	render "users/show"

#   	# redirect_to user_path(blog.user)
#   end

#   def destroy_favorite
#   	blog = Blog.find(params[:blog_id])
#   	favorite = current_user.favorites.find_by(blog_id: params[:blog_id])
#   	favorite.destroy

# # 以下、renderを使用した記述
#   	@user = blog.user
#     @blogs = @user.blogs
#     @blog = Blog.new
#   	render "users/show"

#   	# redirect_to user_path(blog.user)
#   end

# --------------------------------------------------------------------
   private
   def set_variables
     @blog = Blog.find(params[:blog_id])
  #   @id_name = "#favorite-link-#{@blog.id}"
  #   @id_heart = "#heart-#{@blog.id}"
   end
end
