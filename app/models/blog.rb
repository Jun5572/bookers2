class Blog < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true


	# Userモデルに対して1:Nの関係を記述[user: 1 blog: N]
	belongs_to :user
	# Favoriteモデルに対して1:Nの関係を記述[blog: 1 favorite: N]
	has_many :favorites
	# PostCommentモデルに対して1:Nの関係記述[postcomment: 1 blog: N]
	has_many :post_comments

# イイね機能に関する記述。引数で渡されたユーザのidがFavoriteテーブル内に含まれているかをチェック。含まれていればtrue、含まれていなければfalseを返す。
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
