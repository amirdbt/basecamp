class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end

    def create
       @user = User.new(user_params)

       if @user.save
            session[:user_id] = @user.id
            redirect_to '/welcome'
       else
            render 'new'
       end
    end  

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to users_path
    end

    private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :job_title, :location, :password, :password_confirmation)
    end
end
