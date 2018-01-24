class AddNextLevelToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :next_level, :integer
  end
end
