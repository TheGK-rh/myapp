class ActivitiesController < ApplicationController

  def index
    @activities = current_user.active_notifications
  end

end
