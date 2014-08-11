class DropEmployeeProjects < ActiveRecord::Migration
  def change
    drop_table :employee_projects
  end
end
