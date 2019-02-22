class UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :correct_user, only: [:edit, :update]

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
  	if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
  	  redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :email, :introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end
end
