class AddPointsToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :points, :integer
  end
end
