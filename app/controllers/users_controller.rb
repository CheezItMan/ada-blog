class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id] )
    unless @user
      flash[:errors] = "That user does not exist"
      redirect_to users_path
    end
  end

  def login
  end

  def logout
  end
end
