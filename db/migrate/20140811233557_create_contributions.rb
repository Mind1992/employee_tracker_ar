class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.column :description, :string
    end
  end
end
