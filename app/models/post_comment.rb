class PostComment < ApplicationRecord

	# userモデルに対して1:Nを記述
		belongs_to :user
	# blogモデルに対して1:Nを記述
		belongs_to :blog
	# favoriteモデルに対して1:Nを記述
		# has_many :favorites



end
