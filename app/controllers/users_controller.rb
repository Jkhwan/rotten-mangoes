class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(secure_user_params)
    if @user.save
      session[:user_id] = user.id
      redirect_to movies_path
    else
      render :new
    end
  end

  protected

  def secure_user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
