class SessionsController < ApplicationController

  before_action :authorized

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Logged out!'
  end
end
