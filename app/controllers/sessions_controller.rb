class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    # render plain: user.inspect
    if @user 
      session[:user_id] = @user.id 
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
    # render plain: params[:session].inspect
  end

  # def login
  # end

  def welcome
  end

  def page_requires_login
    
  end
  def destroy
    session.destroy
    redirect_to '/welcome', notice: "Logged Out Successfully"
  end

 
end
