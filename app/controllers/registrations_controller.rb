class RegistrationsController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
 
  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id 
      UserMailer.with(user: @user).welcome_email.deliver_now 
      redirect_to root_path, notice: "Successfully Created Account"
    else
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end    
end
