class ProjectsController < ApplicationController

    def index
        # @pagy,@projects = pagy(Project.all, items:5)
        @projects = Project.where(user_id: params[:user_id]).order("created_at DESC")
    end
    # def new
    #     @project = Project.new
    # end
    def edit
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:id]) 
     
    end
    def user_edit
        @user = User.find(params[:user_id])
        @project = Project.find(params[:project_id])
    end
    def show
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:id])
        @users = User.all
        
    end
    def create
        @user = User.find(params[:user_id])
        @project = @user.projects.create(project_params)
        # render plain: @project.inspect
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
        # @projects = Project.paginate(page: params[:page], per_page: 10)
        @pagy, @projects = pagy(Project.all, items:10)
        flash.now[:notice] = "#{@projects.size} - Projects"
    end

    def delete_image_attachment
        @image = ActiveStorage::Attachment.find(params[:image_id])
        @image.purge        
        # redirect_to user_project_path, notice: "Attachment deleted successfully!"
    end
    def allUsers
        @users = User.all
    end
    private
    def project_params
        params.require(:project).permit(:name, :details, image: [])
    end
    def topic_params
        params.require(:topic).permit(:name)
    end
end
