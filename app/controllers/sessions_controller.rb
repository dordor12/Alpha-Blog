class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: session_params[:email].downcase
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'you have sucssefuly logged in'
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'There Was something worng with your login information'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:warning] = 'you have logged out'
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
