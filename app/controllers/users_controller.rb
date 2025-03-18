class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    flash[:notice] = "Thanks for signing up! Please log in with your new account."
    redirect_to "/login"
  end
end
