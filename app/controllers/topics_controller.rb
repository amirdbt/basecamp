class TopicsController < ApplicationController
    def index
        @topics = Topic.where(project_id: params[:project_id])
        # render plain: Topic.where(project_id: params[:project_id]).inspect
    end
    def new
        @topic = Topic.new
    end
    def show
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:project_id]) 
        # @topic =@user.project.find(params[:id])
        # @topic  = Topic.where(topic_id: params[:id])
        # @messages = Message.all
    end
    def create
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:project_id]) 
        topic = Topic.new
        topic.name = topic_params[:name]
        topic.project_id = @project.id
        topic.user_id = @user.id
        if topic.save
            redirect_to user_projects_path, notice: "Thread created"
        else
            render 'new'
        end      
        
    end
    def edit
        @topic =Topic.find(params[:id])
    end
    def update
        render plain: params.inspect
    end
    def destroy
        @topic =Topic.find(params[:id])
        @topic.destroy
        redirect_to user_project_topics_path, notice: "Thread Deleted"
    end

    private
    def topic_params
        params.require(:topic).permit(:name)
    end
end
