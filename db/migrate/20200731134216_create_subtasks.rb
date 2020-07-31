class CreateSubtasks < ActiveRecord::Migration[5.2]
  def change
    create_table :subtasks do |t|
      t.string :name
      t.integer :task_id
      t.integer :user_id

      t.timestamps
    end
  end
end
