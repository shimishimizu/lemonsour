class Review < ApplicationRecord
	belongs_to :user

	belongs_to :product

    validates :review_star, presence: true
    validates :opinion, length: { maximum: 1000 }
    validates :user_id, uniqueness: { scope: :product_id }

end
