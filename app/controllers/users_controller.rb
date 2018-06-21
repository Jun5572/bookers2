class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]
  # acts_as_followable # フォロワー機能
  # acts_as_follower   # フォロー機能

	# アプリ利用ユーザー一覧[Users]
  def index
    @users = User.all
    @blog = Blog.new

    @user = current_user
  end

  # マイプロフィール編集
  def edit
    @user = User.find(params[:id])
  end
  # データ更新
  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:update] = "Profile was successfully updated!"
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
    @blog = Blog.new
  end

  # イイね機能のcreate,destroyアクションの記述
  def create_favorite
    blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.new(blog_id: blog.id)
    favorite.save
    redirect_to user_path(blog.user)
  end

  def destroy_favorite
    blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.find_by(blog_id: params[:blog_id])
    favorite.destroy
    redirect_to user_path(blog.user)
  end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :introduction, :image)
      end

      # URL直接入力しても他人の編集ページにリンクできなくしている記述
      def correct_user
        @user = User.find(params[:id])
        if @user != current_user
          redirect_to(root_path)
        end
      end
end
