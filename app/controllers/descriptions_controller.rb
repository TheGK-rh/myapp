class DescriptionsController < ApplicationController

  before_action :find_task
  before_action :find_description, only: [:edit, :update, :destroy]

  def create
    @description = @task.descriptions.build(description_params)
    @description.user_id = current_user.id
    @description.save
    @descriptions = @task.descriptions
  end

  def edit
  end

  def update
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
