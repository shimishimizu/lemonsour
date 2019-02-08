class ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page])
  end

  def show
  	@product = Product.find(params[:id])
    @review = Review.new
    #@reviews = Review.where(product_id: @product)
    @reviews = Kaminari.paginate_array(Review.where(product_id: @product)).page(params[:page]).per(5)
  end

  private
  def products_params
  	params.require(:product).permit(:user_id, :product_image, :product_name, :maker, :release_date, :degree, :nutrition,
                                    reviews_attribute: [:opinion, :review_star])
  end
end
