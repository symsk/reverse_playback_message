class UsersController < ApplicationController
  before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def require_login
  #   redirect_to root_path
  # end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end