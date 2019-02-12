class ReviewsController < ApplicationController
	def create
		product = Product.find(params[:product_id])
		review = current_user.reviews.new(review_params)
		review.product_id = product.id
		review.save!
		redirect_to product_path(product.id)
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		@review.update(review_params)
		redirect_to user_path(current_user)
	end

	def destroy
		@reviews = Review.find(params[:id])
		@user = User.where(review_id: @reviews)
		@reviews.destroy!
		redirect_to user_path(current_user)
	end

	private
	def review_params
		params.require(:review).permit(:user_id, :product_id, :review_star, :opinion)
	end
end
