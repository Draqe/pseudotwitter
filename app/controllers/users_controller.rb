class UsersController < ApplicationController

  before_action :authorize, except: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @tweets = Tweet.order(created_at: :desc)
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end


private

  def user_params
    params.require(:user).
      permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
