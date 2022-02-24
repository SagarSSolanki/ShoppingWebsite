class ApplicationController < ActionController::Base
  helper_method :current_user

  def is_loggedin
    redirect_to root_path, notice: "User Not Logged In" if current_user.blank?
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end
end
