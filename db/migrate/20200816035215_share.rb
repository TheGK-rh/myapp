class Share < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true
    end
  end
end
