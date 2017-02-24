class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    return redirect_to signup_path unless user.save
    session[:user_id] = user.id
    redirect_to root_path, notice: "You have successfully signed up!"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
