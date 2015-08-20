class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params)
  end

  def show
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
