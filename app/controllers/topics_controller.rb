class TopicsController < ApplicationController
    def index
        @topics = Topic.where(project_id: params[:project_id])
         @project = Project.find(params[:project_id]) 
        
        # render plain: @project[:user_id].inspect
    end
    def new
        @topic = Topic.new
    end
    def show
         @user = User.find(params[:user_id])
         @project = @user.projects.find(params[:project_id]) 
        # @topic =@user.project.find(params[:id])
        @topic  = Topic.find(params[:id])
        # render plain: @topic.messages.inspect
        @messages = Message.all
    end
    def create
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:project_id]) 
        topic = Topic.new
        topic.name = topic_params[:name]
        topic.project_id = @project.id
        topic.user_id = @user.id
        if topic.save
            redirect_to user_project_topics_path, notice: "Thread created"
        else
            render 'new'
        end      
        
    end
    def edit
        @topic =Topic.find(params[:id])
    end
    def update
        @user = User.find(params[:user_id])
        @project = @user.projects.find(params[:project_id]) 
        @topic = Topic.find(params[:id])
        if @topic.update(topic_params)
            redirect_to user_project_topics_path, notice: "Thread updated"
        else
            render 'edit'
        end
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
