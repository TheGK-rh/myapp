class AddCompletedToSubtasks < ActiveRecord::Migration[5.2]
  def change
    add_column :subtasks, :completed, :boolean, default: false, null: false
  end
end
