class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def show
    
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクが正常に保存されました。"
      redirect_to @task
    else
      flash.now[:danger] = "タスクが投稿されませんでした。"
      render :now
    end
  end

  def edit
    
  end

  def update
    
      if @task.update(task_params)
        flash[:sucess] = "正常に更新されましたよ。"
        redirect_to @task
      else
        flash.now[:danger] = "更新されませんでした。"
        render :edit
      end
  end

  def destroy
    
    @task.destroy
    
    flash[:success] = "タスクは削除されました。"
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  
  def task_params
    params.require(:task).permit(:content)
  end
  
end
