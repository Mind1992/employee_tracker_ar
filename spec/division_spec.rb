require 'spec_helper'

describe Division do
  it 'has many employees' do
    division = Division.create({:name => "Accounting"})
    employee1 = Employee.create({:name => "Ricky", :division_id => division.id})
    employee2 = Employee.create({:name => "Bobby", :division_id => division.id})
    division.employees.should eq [employee1, employee2]
  end
end
