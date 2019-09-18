class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user) }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user) }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    if @user.destroy
      respond_to do |format|
        format.html { redirect_to users_path }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
