class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :own_user, only: [:edit, :update, :destroy]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "編集しました"
    else
      render :edit
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
  def own_user
    if current_user.id != @user.id
      redirect_to user_path
    end
  end
end
