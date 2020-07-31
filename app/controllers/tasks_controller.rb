class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def show
  end

  def create
    @task = Task.create(task_params)
    @tasks = Task.all
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
  end

  private

    def task_params
      params.require(:task).permit(:title, :user_id, :category_id)
    end

    def find_task
      @task = Task.find(params[:id])
    end

end
