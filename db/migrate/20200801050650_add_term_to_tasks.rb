class AddTermToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :term, :date
  end
end
