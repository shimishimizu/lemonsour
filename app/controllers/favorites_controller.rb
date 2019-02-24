class FavoritesController < ApplicationController
   before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @favorites = Kaminari.paginate_array(Favorite.where(user_id: @user).order('updated_at DESC')).page(params[:page]).per(8)
  end

  def create
    @product = Product.find(params[:product_id])
    @favorite = Favorite.create(user_id: current_user.id, product_id: params[:product_id])
    @favorite.save
    @favorites = Favorite.where(product_id: params[:product_id])
    @product.reload
  end

  def destroy
    @product = Product.find(params[:product_id])
    favorite = Favorite.find_by(user_id: current_user.id, product_id: params[:product_id])
    favorite.destroy
    @favorites = Favorite.where(product_id: params[:product_id])
    @product.reload
  end

end
