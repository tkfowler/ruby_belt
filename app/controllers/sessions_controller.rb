class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/songs'
    else
      flash[:errors] = ["Invalid"]
      redirect_to '/main'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/main'
  end
end
