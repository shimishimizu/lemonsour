class UsersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @favorites = Favorite.where(product_id: @product)
  end

  def show
    @user = User.find(params[:id])
    @reviews = Kaminari.paginate_array(Review.where(user_id: @user).order('updated_at DESC')).page(params[:page]).per(5)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :email, :introduction)
  end
end
