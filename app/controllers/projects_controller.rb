class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
    # def new
    #     @project = Project.new
    # end
    def edit
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:id]) 
     
    end
    def show
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:id])
    end
    def create
        @user = User.find(params[:user_id])
        @project = @user.projects.create(project_params)
        # @project.image.attach(params[:image])
        redirect_to user_projects_path, notice: "Project created!"
    end
    def update
        @user = User.find(params[:user_id])        
        @project = @user.projects.find(params[:id])
        # @project.image.attach(params[:image])
        if @project.update(project_params)
            redirect_to user_projects_path, notice: "Project updated"
        else
            render 'edit'
        end
    end
    def destroy
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:id])
        @project.destroy
        redirect_to user_projects_path, notice: "Project deleted successfully!"
    end
    def all_projects
        @projects = Project.all
        flash.now[:notice] = "#{@projects.size} - Projects"
    end

    private
    def project_params
        params.require(:project).permit(:name, :details, :image)
    end
end
