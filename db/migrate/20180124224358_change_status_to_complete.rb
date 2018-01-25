class ChangeStatusToComplete < ActiveRecord::Migration[5.1]
  def change
    rename_column :tasks, :status, :complete
    rename_column :projects, :status, :complete
  end
end
