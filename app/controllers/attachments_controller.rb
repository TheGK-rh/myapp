class AttachmentsController < ApplicationController

  before_action :find_task

  def create
    @attachment = @task.attachments.build(attachment_params)
    @attachment.user_id = current_user.id
    @attachment.save
    @attachments = @task.attachments
  end

  def destroy
  end

  private

    def find_task
      @task = Task.find(params[:task_id])
    end

    def attachment_params
      params.require(:attachment).permit(:image, :task_id, :user_id)
    end

end
