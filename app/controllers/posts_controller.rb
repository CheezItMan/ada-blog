class PostsController < ApplicationController
  before_action :find_user

  def index
    unless @user
      flash[:error] = "That blog doesn't exist"
      redirect_to root_path, status: 404
    else
      @posts = @user.posts
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def find_user
      @user = User.find_by(id: params[:id])
    end
end
