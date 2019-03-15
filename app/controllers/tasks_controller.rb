class TasksController < ApplicationController
  before_action :set_up, only: [ :show, :edit, :update, :destroy]
  
  def index
    # @tasks = Task.all
    @tasks = Task.where(is_display: true).limit(5)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "タスクを登録しました。"
      redirect_to @task
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "タスクを更新しました。" 
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def hide
    @tasks = Task.where(is_display: false).limit(5)
  end

  private

  def task_params
    params.require(:task).permit(:title, :memo, :is_display, :status)
  end

  def set_up
    @task = Task.find(params[:id])
  end


end
