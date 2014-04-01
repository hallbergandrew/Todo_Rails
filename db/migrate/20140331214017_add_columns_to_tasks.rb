class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :list_id, :int
    add_column :tasks, :done, :boolean
  end
end
