require 'rspec'
require 'active_record'

require 'employee'
require 'division'
require 'project'
require 'pry'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy }
    Division.all.each { |division| division.destroy }
    Project.all.each  { |project| project.destroy }
  end
end

