class Post < ApplicationRecord
	belongs_to :user
    has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :favorites, dependent: :destroy

	validates :body, presence: true
	validates :opinion, presence: true

	def liked_by?(user)
	    likes.where(user_id: user.id).exists?
	end

	def favorited_by?(user)
	    favorites.where(user_id: user.id).exists?
	end

end
