class SessionsController < ApplicationController

  def new

  end

  def create
    if fb_auth = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(fb_auth)
      session[:user_id] = user.id

      redirect_to root_path, notice: "#{user.name} has successfully signed in!"
    else
      user = User.find_by(email: params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "You have successfully signed in!"
      else
        redirect_to '/login', alert: "We did not recognize that email or password, please try again!"
      end 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
