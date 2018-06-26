class Favorite < ApplicationRecord

	# userモデルに対して1:Nの関係を記述
	belongs_to :user
	# blogモデルに対して1:Nの関係を記述
	belongs_to :blog, counter_cache: :favorites_count
	# postcommentモデルに対して1:Nの関係を記述
	# belongs_to :post_comments
end
