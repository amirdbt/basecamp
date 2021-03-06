class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def index
        @pagy ,@users = pagy(User.all,items:5)
        flash.now[:notice] = "Users - #{@users.size}"
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
            redirect_to '/welcome',  notice: "You are logged in, #{@user.firstname}"
       else
            render 'new', notice: "Invalid User"
       end
    end  

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to users_path
    end
  
    def makeAdmin       
        @user = User.find(params[:format])
        if @user[:admin] == true
            @user.update_attribute(:admin, false)           
        else
            @user.update_attribute(:admin, true)
        end
        # render plain: @user[:admin]
        # @user.update(status: params[:status])
        redirect_to users_path
    end

    def shared_projects
        @user = User.find(current_user.id)
        # render plain: @user.project_users.inspect
    end

    private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :job_title, :location, :password, :password_confirmation)
    end
end
