class CreateProjectHistory < ActiveRecord::Migration
  def change
    create_table :project_histories do |t|
      t.belongs_to :employee
      t.belongs_to :project
    end
  end
end
