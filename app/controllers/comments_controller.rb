class CommentsController < ApplicationController

  before_action :find_task
  before_action :find_comment, only: [:destroy]

  def create
    @comment = @task.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @comments = @task.comments
  end

  def destroy
    @comment.destroy!
  end

  private

    def find_task
      @task = Task.find(params[:task_id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :task_id, :user_id)
    end

end
