class AddContributionIdToEmployeesProjects < ActiveRecord::Migration
  def change
    add_column :employees_projects, :contribution_id, :integer
  end
end
