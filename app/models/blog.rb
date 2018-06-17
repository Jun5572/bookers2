class Blog < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true


	# Userモデルに対して1:Nの関係を明示
	belongs_to :user
end
