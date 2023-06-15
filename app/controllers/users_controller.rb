class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
    #  @user = User.new(params[:user])

    if @user.save
      redirect_to new_user_path, notice: "User created succesfully."
    else
      render :new, status: :unprocessable_entity
  end
end

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end