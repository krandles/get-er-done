class ChangeTaskDatetimesToDates < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :due_date, :date
    change_column :tasks, :complete_date, :date
  end
end
