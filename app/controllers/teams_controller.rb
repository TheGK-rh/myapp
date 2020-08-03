class TeamsController < ApplicationController

  def index
    @teams = Team.all.order("created_at DESC")
  end

  def show
    @team = Team.find(params[:id])
    @owner = @team.owner
    @team_members = @team.team_members
  end

  def new
    @team = Team.new
    @user = current_user.followers
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    if @team.save
      redirect_to teams_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private

    def team_params
      params.require(:team).permit(:team_name, :user_id, team_member_ids:[])
    end

end
