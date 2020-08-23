class AddTaskIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :task_id, :integer
  end
end
