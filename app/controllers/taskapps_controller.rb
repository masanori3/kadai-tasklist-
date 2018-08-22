class TaskappsController < ApplicationController
  def index
    @taskapps = Taskapp.all
  end
  
  def show
    @taskapp = Taskapp.find(params[:id])
  end

  def new
    @taskapp = Taskapp.new
  end

  def create
    @taskapp = Taskapp.new(taskapp_params)
    if @taskapp.save
      flash[:success] = "タスクが正常に保存されました。"
      redirect_to @taskapp
    else
      flash.now[:danger] = "タスクが投稿されませんでした。"
      render :now
    end
  end

  def edit
    @taskapp = Taskapp.find(params[:id])
  end

  def update
    @taskapp = Taskapp.find(params[:id])
      if @taskapp.update(taskapp_params)
        flash[:sucess] = "正常に更新されましたよ。"
        redirect_to @taskapp
      else
        flash.now[:danger] = "更新されませんでした。"
        render :edit
      end
  end

  def destroy
    @taskapp = Taskapp.find(params[:id])
    @taskapp.destroy
    
    flash[:success] = "タスクは削除されました。"
    redirect_to taskapps_url
  end
  
  private
  
  def taskapp_params
    params.require(:taskapp).permit(:content)
  end
  
end
