class AttachmentsController < ApplicationController

  before_action :find_task
  before_action :find_attachment, only: [:destroy, :download]

  def create
    @attachment = @task.attachments.build(attachment_params)
    @attachment.user_id = current_user.id
    if @attachment.save
      redirect_to task_path(@task), notice: "ファイルをアップロードしました"
    end
    @attachments = @task.attachments
  end

  def destroy
    @attachment.destroy
    redirect_to task_path(@task)
  end

  def download
    send_data(@attachment.image.read, filename: "download#{File.extname(@attachment.image.path)}")
  end

  private

    def find_task
      @task = Task.find(params[:task_id])
    end

    def find_attachment
      @attachment = Attachment.find(params[:id])
    end

    def attachment_params
      params.require(:attachment).permit(:image, :task_id, :user_id)
    end

end
