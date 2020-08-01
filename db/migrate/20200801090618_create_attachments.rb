class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.string :image
      t.integer :task_id
      t.integer :user_id

      t.timestamps
    end
  end
end
