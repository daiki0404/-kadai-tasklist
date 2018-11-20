class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクが作成されました。"
      redirect_to @task
    else
      flash.now[:danger] = "タスクの作成に失敗しました。"
      render :new
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = "更新しました"
      redirect_to @task
    else
      flash.now[:danger] = "更新できませんでした"
      render :edit
    end
  end
  
  def destroy
    @message = find(params[:id])
    @message.destroy
    flash[:success] = "正常に削除されました"
    redirect_to tasks_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content,:status)
  end
end
