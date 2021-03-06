class SessionsController < ApplicationController
  
  def new; end

  def create 
    user = User.find_by(email: user_params[:email])
    if user.present? && user.authenticate(user_params[:password])
      session[:user_id] = user.id 
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new 
    end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out!"
  end

  private 
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
