class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
      t.boolean :status
      t.integer :priority
      t.integer :project_id
      t.integer :category_id
      t.integer :user_id
      t.timestamps
    end
  end
end
