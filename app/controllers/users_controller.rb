class UsersController < ApplicationController
  def main
    if current_user
      redirect_to '/songs'
    else
      render 'main'
    end
  end

  def create
    @user = User.create( user_params )
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to '/songs'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/main'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
