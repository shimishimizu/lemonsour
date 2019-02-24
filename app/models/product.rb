class Product < ApplicationRecord
	attachment :product_image

	belongs_to :user

	has_many :reviews, dependent: :destroy

	has_many :favorites, dependent: :destroy

    def reviewed_by?(user)
    	reviews.where(user_id: user.id).exists?
    end

    def favorite_user(user_id)
   favorites.find_by(user_id: user_id)
  end

end
