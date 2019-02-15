class ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page]).order(params[:sort])
  end

  def show
  	@product = Product.find(params[:id])
    @review = Review.new
    @reviews = Kaminari.paginate_array(@product.reviews.order('updated_at DESC')).page(params[:page]).per(5)
    @average_star = @product.reviews.average(:review_star)
  end

  def search
    @products = Product.search(params[:search]).page(params[:page])
    render :index
  end

  private
  def products_params
  	params.require(:product).permit(:user_id, :product_image, :product_name, :maker, :release_date, :degree, :nutrition,
                                    reviews_attribute: [:opinion, :review_star])
  end
end
