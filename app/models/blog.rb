class Blog < ApplicationRecord
	validates :title, presence: true
	validates :body, length: {maximum: 200}, presence: true


	# Userモデルに対して1:Nの関係を記述[user: 1 blog: N]
	belongs_to :user
	# Favoriteモデルに対して1:Nの関係を記述[blog: 1 favorite: N]
	has_many :favorites, dependent: :destroy
	# PostCommentモデルに対して1:Nの関係記述[postcomment: 1 blog: N]
	has_many :post_comments

# Qiitaより抜粋、Ajax対応の為に記述
	def favorite_user(user_id)
		favorites.find_by(user_id: user_id)
	end
	
# イイね機能に関する記述。引数で渡されたユーザのidがFavoriteテーブル内に含まれているかをチェック。含まれていればtrue、含まれていなければfalseを返す。
	# def favorited_by?(user)
	# 	favorites.where(user_id: user.id).exists?
	# end
end
