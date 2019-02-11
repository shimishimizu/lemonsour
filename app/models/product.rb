class Product < ApplicationRecord
	attachment :product_image

	has_many :reviews, dependent: :destroy

	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
    end
end
