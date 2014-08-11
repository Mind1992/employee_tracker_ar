class AddColumnToEmployeesProjects < ActiveRecord::Migration
  def change
    add_column :employees_projects, :description, :string
  end
end
