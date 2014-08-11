class DropProjectHistories < ActiveRecord::Migration
  def change
    drop_table :project_histories
  end
end
