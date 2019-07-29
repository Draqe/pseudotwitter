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
      flash[:notice] = 'Account created successfully!'
      redirect_to root_path
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
