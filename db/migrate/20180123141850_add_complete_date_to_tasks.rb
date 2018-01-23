class AddCompleteDateToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :complete_date, :datetime
  end
end
