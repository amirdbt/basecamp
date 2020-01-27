class TasksController < ApplicationController
    def index
        @tasks = Task.where(project_id: params[:project_id])
    end
    def new
        @task = Task.new
    end
    def create
        @user = User.find(params[:user_id])
        @project = Project.find(params[:project_id])
        task = Task.new
        task.title = task_params[:title]
        task.project_id = @project.id 
        task.user_id = @user.id 
        if task.save
            redirect_to user_project_tasks_path, notice: "Task Added"
        else
            render 'new'
        end
        # render plain: params.inspect
    end
    def edit
        @task = Task.find(params[:id])
    end
    def update
        @user = User.find(params[:user_id])
        @project =Project.find(params[:project_id]) 
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to user_project_tasks_path, notice: "Task updated"
        else
            render 'edit'
        end
    end
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to user_project_tasks_path, notice: "Task Deleted"
    end

    private
    def task_params
        params.require(:task).permit(:title)
    end
end
