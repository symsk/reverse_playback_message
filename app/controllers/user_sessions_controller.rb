class UserSessionsController < ApplicationController
  # before_action :require_login

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to root_path, notice: 'ログインしました'
    else
      flash[:alert] = 'ログイン失敗'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
