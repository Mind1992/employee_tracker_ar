class DropColumnDescription < ActiveRecord::Migration
  def change
    remove_column :employees_projects, :description, :string
  end
end
