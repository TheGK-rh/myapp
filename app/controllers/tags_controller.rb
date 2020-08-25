class TagsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_tag, only: [:edit, :update, :destroy, :complete, :purge]

  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.user_id = current_user.id
    if @tag.save
      redirect_to tags_path, notice: "タグを作成しました"
    end
    @tags = Tag.all
  end

  def edit
  end

  def update
  end

  def destroy
    @tag.destroy
  end

  private

    def find_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:name, :user_id)
    end

end
