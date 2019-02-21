class ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page]).eager_load(:reviews, :favorites).group("products.id").order(params[:sort])
    @reviews = Review.all
  end

  def show
  	@product = Product.find(params[:id])
    @review = Review.new
    @reviews = Kaminari.paginate_array(@product.reviews.order('updated_at DESC')).page(params[:page]).per(5)
    @average_review_star = @product.reviews.average(:review_star)
  end

  def search
    @products = Product.search(params[:search]).page(params[:page])
    @reviews = Review.all
    render :index
  end

  private
  def products_params
  	params.require(:product).permit(:user_id, :product_image, :product_name, :maker, :release_date, :degree, :nutrition, :average_star,
                                    reviews_attribute: [:opinion, :review_star])
  end
end
