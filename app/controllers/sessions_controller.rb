class SessionsController < ApplicationController

  layout 'login'

  def new; end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      path = session[:return_to_url] ? session[:return_to_url] : admin_posts_path
      redirect_to path, notice: "Logged In"
    else
      flash.now.alert = "Email or password invalid."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path
  end
end
