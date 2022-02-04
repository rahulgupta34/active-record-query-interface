class AddColumnToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :salary, :integer, limit: 2
  end
end
