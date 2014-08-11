require 'spec_helper'

describe Project do
  it 'belongs to an employee' do
    division = Division.create({:name => "Accounting"})
    employee = Employee.create({:name => "Ricky", :division_id => division.id})
    project = Project.create({:name => "Clean Gutters", :employee_id => employee.id})
    expect(project.employee_id).to eq employee.id
  end
end
