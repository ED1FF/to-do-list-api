class AddDefaultValueToDoneInTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :done, false
    change_column_default :tasks, :done, from: nil, to: false
  end
end
