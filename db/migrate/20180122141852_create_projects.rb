class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :status
      t.integer :points
      t.timestamps
    end
  end
end
