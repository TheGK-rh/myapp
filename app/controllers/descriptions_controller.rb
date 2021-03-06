class DescriptionsController < ApplicationController

  before_action :find_task
  before_action :find_description, only: [:edit, :update, :destroy]

  def create
    @description = @task.descriptions.build(description_params)
    @description.user_id = current_user.id
    if @description.save
      redirect_to task_path(@task), notice: "タスク詳細を作成しました"
    end
    @descriptions = @task.descriptions
  end

  def edit
  end

  def update
    if @description.update(description_params)
      redirect_to @task
    end
  end

  def destroy
    @description.destroy
  end

  private

    def find_task
      @task = Task.find(params[:task_id])
    end

    def find_description
      @description = Description.find(params[:id])
    end

    def description_params
      params.require(:description).permit(:description, :task_id, :user_id)
    end

end
