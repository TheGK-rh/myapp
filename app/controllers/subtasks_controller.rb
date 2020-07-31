class SubtasksController < ApplicationController

  before_action :find_task
  before_action :find_subtask, only: [:edit, :update, :destroy, :complete, :purge]

  def create
    @subtask = @task.subtasks.build(subtask_params)
    @subtask.user_id = current_user.id
    @subtask.save
    @subtasks = @task.subtasks
  end

  def destroy
    @subtask.destroy
  end

  def complete
    @subtask.update_attribute(:completed, true)
    redirect_to @task
  end

  def purge
    @subtask.update_attribute(:completed, false)
    redirect_to @task
  end

  private

    def find_task
      @task = Task.find(params[:task_id])
    end

    def find_subtask
      @subtask = Subtask.find(params[:id])
    end

    def subtask_params
      params.require(:subtask).permit(:name, :task_id)
    end

end
