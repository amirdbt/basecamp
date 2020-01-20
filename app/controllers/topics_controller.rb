class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end
    def new
        @topic = Topic.new

    #     @user = User.find(params[:user_id])
    #     @project = @user.projects.find(params[:project_id]) 
    #     # @topic = @project.topics.find(params[:id])
    #     render plain: @project.inspect
    #     # render plain: params.inspect
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
        
    end
    
    def destroy
        
    end

    private
    def topic_params
        params.require(:topic).permit(:name)
    end
end
