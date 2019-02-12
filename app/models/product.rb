class Product < ApplicationRecord
	attachment :product_image

	belongs_to :user

	has_many :reviews, dependent: :destroy

	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
    end

    def reviewed_by?(user)
    	reviews.where(user_id: user.id).exists?
    end

end
