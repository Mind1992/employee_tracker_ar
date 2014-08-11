require 'spec_helper'

describe Project do
  it 'has many employees' do
    division = Division.create({:name => "Accounting"})
    division.save
    employee = Employee.create({:name => "Ricky", :division_id => division.id})
    employee2 = Employee.create({:name => "Bobby", :division_id => division.id})
    division.employees << employee
    division.employees << employee2
    project = Project.create({:name => "Clean Gutters"})
    project.employees << employee
    project.employees << employee2
    expect(project.employees.first).to eq employee
  end
end
