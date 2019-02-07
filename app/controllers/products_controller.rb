class ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page])
  end

  def show
  	@product = Product.find(params[:id])
    @review = Review.new
    # @reviews = Review.where(params[:product_id])

  end

  private
  def products_params
  	params.require(:product).permit(:user_id, :product_image, :product_name, :maker, :release_date, :degree, :nutrition,
                                    reviews_attribute: [:opinion, :review_star])
  end
end
