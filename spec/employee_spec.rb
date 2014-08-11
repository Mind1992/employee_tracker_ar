require 'spec_helper'

describe Employee do
  it "belongs to a division" do
    division = Division.create({:name => "Accounting"})
    employee = Employee.create({:name => "Ricky", :division_id => division.id})
    expect(division.employees.first).to eq employee
  end

  it 'has many projects' do
    division = Division.create({:name => "Porter"})
    employee = Employee.create({:name => "Ricky", :division_id => division.id})
    project = Project.create({:name => "Clean Gutters"})
    project2 = Project.create({:name => "Clean Ovens"})
    employee.projects << project
    employee.projects << project2
    expect(employee.projects).to eq [project, project2]
  end
end
