class ReviewsController < ApplicationController
	 before_action :authenticate_user!
	 before_action :correct_user, only: [:edit, :update]

	def create
        @product = Product.find(params[:product_id])
		@review = current_user.reviews.new(review_params)
		@review.product_id = @product.id
		    @reviews = Kaminari.paginate_array(@product.reviews.order('updated_at DESC')).page(params[:page]).per(5)
		if @review.save
			@reviews = @product.reviews.pluck(:review_star)
			@product.average_star = @reviews.sum.to_f / @reviews.count
			if @product.save
				flash[:notice] = "レビューを投稿しました"
				redirect_to product_path(@product.id)
			end
		else
			render 'products/show'
		end
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)

			product = Product.find_by(params[:product_id])
			@reviews = product.reviews.pluck(:review_star)
			product.average_star = @reviews.sum.to_f / @reviews.count
			if product.save!
				flash[:notice] = "レビューを編集しました"
				redirect_to user_path(current_user)
			end
		else
			render :edit
		end
	end

	def destroy
		reviews = Review.find(params[:id])
		user = User.where(review_id: @reviews)
		if reviews.destroy!

			@product = Product.find_by(params[:product_id])
			reviews = @product.reviews.pluck(:review_star)
			@product.average_star = reviews.sum.to_f / reviews.count

			@reveiw = Review.new
			@reviews = Kaminari.paginate_array(@product.reviews.order('updated_at DESC')).page(params[:page]).per(5)
			if @product.save!
				flash[:notice] = "レビューを削除しました"
				redirect_to user_path(current_user)
			end
		else
			render 'products/show'
		end
	end

	private
	def review_params
		params.require(:review).permit(:user_id, :product_id, :review_star, :opinion)
	end

	def correct_user
		review = Review.find(params[:id])
		if review.user.id != current_user.id
			redirect_to root_path
		end
	end

end