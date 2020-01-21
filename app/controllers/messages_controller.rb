class MessagesController < ApplicationController
    def new
        @message = Message.new
    end
    def create
        @user = User.find(params[:user_id])
        @topic = Topic.find(params[:topic_id])
        message = Message.new
        message.content = message_params[:content]
        message.user_id = @user.id
        message.topic_id = @topic.id 
        if message.save
           redirect_to user_project_topic_path(user_id: @user.id, project_id: params[:project_id], id: @topic.id), notice: "Message added!"
        # render plain: @topic
        # /users/:user_id/projects/:project_id/topics/:id(.:format)
        else
            render 'new'
        end
    end
    def edit
        @message = Message.find(params[:id])
    end
    def destroy
        @user = User.find(params[:user_id])
        @topic = params[:topic_id]
        @message = Message.find(params[:id])
        @message.destroy
        redirect_to user_project_topic_path(user_id: @user.id, project_id: params[:project_id], id: params[:topic_id]), notice: "Message deleted!"
    end
    private
    def message_params
        params.require(:message).permit(:content)
    end
end
