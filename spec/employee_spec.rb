require 'spec_helper'

describe Employee do
  it "belongs to a division" do
    division = Division.create({:name => "Accounting"})
    employee = Employee.create({:name => "Ricky", :division_id => division.id})
    expect(division.employees.first).to eq employee
  end
end
