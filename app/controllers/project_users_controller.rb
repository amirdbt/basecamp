class ProjectUsersController < ApplicationController
    def index
        @project_users = ProjectUser.where(project_id: params[:project_id])
    end
    def new
    #   @project_user = ProjectUser.new
      @users = User.pluck(:firstname, :id).to_a.unshift(["Select User", ""])
    #   render plain: @users.join("")
    end

    def create
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:project_id])
        project_user = ProjectUser.new
        project_user.project_id = @project.id
        project_user.user_id = project_user_params[:user]
        project_user.del = project_user_params[:del]
        project_user.update_access = project_user_params[:update_access]
        project_user.create = project_user_params[:create]
        project_user.read = project_user_params[:read]      
         
        if project_user.save     
            redirect_to user_project_project_users_path, notice: "User added successfully"  
        else
            render 'new'  
        end    
        
    end      
    def user_destroy
        @project = Project.find(params[:project_id])        
        @project.destroy
        redirect_to user_project_project_users_path, notice: "Project shared has been deleted successfully."
        # render plain: @project.inspect
    end
    private
    def project_user_params
        params.require(:project_user).permit(:user,:create,:read,:update_access,:del)
    end
end
