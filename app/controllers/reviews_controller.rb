class ReviewsController < ApplicationController
	def create
		product = Product.find(params[:product_id])
		review = current_user.reviews.new(review_params)
		review.product_id = product.id
		review.save!
		redirect_to product_path(product.id)
	end

	def update
	end

	def destroy
	end

	private
	def review_params
		params.require(:review).permit(:user_id, :product_id, :review_star, :opinion)
	end
end
