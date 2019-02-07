class Product < ApplicationRecord
	attachment :product_image

	has_many :reviews, dependent: :destroy
end
