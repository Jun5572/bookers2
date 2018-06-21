class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
    	:recoverable, :rememberable, :trackable, :validatable

	validates :name, presence: true
	validates :email, presence: true


        # Blogモデルに対して1:Nの関係を明示
    has_many :blogs
    	# Favoriteモデルに対して1:Nの関係を記述
    has_many :favorites
      # PostCommentモデルに対して1:Nの関係を記述
    has_many :post_comments
    	# 画像投稿機能のあるモデルには書きを記述
    attachment :image
end
