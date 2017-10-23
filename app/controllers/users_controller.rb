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
    auth_hash = request.env['omniauth.auth']
    ap auth_hash

    @user = User.find_by(uid: auth_hash['uid'], provider: auth_hash['provider'])

    if @user
      session[:uid] = @user.uid
      session[:provider] = @user.provider
      flash[:success] = "Welcome back #{@user.name}"
    else
      @user = User.new(name: auth_hash['info']['nickname'], uid: auth_hash['uid'], provider: auth_hash['provider'])

      if @user.save
        flash[:success] = "Welcome #{@user.name}"
      else
        flash[:error] = "Could not log in user"
      end
    end
    redirect_to root_path
  end

  def logout
    @user = User.find_by(uid: session[:uid], provider: session[:provider] )

    if @user
      session[:uid] = nil
      session[:provider] = nil
      flash[:success] = "Goodbye #{@user.name}"
      response_code = :success
    else
      flash[:error] = "You are already logged out"
      response_code = :not_found
    end
    redirect_to root_path
  end

end
