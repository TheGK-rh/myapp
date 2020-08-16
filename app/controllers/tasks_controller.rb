class TasksController < ApplicationController

  before_action :authenticate_user!
  before_action :find_task, only: [:show, :edit, :update, :destroy, :gotowork, :gotocomplete, :backtodolist]

  def index
    @tasks = Task.search(params[:search])
    @task = Task.new
    @tags = Tag.where(user_id: current_user.id)
    @members = current_user.followers
  end

  def show
    @share_members = @task.task_shares
    @attachment = Attachment.new
    @attachments = @task.attachments.order("created_at ASC")
    @comment = Comment.new
    @comments = @task.comments.order("created_at ASC")
    @description = Description.new
    @descriptions = @task.descriptions.order("created_at DESC")
    @subtask = Subtask.new
    @subtasks = @task.subtasks.order("created_at ASC")
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
    @tasks = Task.all
  end

  def edit
    @tags = Tag.where(user_id: current_user.id)
    @members = current_user.followers
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

  def gotowork
    @task.update_attribute(:category_id, 2)
    redirect_to root_path
  end

  def gotocomplete
    @task.update_attribute(:category_id, 3)
    redirect_to root_path
  end

  def backtodolist
    @task.update_attribute(:category_id, 1)
    redirect_to root_path
  end

  private

    def task_params
      params.require(:task).permit(:title, :term, :category_id, :user_id, tag_ids: [], task_share_ids:[])
    end

    def find_task
      @task = Task.find(params[:id])
    end

end
