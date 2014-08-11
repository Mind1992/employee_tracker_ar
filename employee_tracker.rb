require 'active_record'
require './lib/employee'
require './lib/division'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to the Employee Tracker!"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press '1' to add a employee, or '2' to list your employees."
    puts "Press '*' to exit."
    choice = gets.chomp
    case choice
    when '1'
      add
    when '2'
      list
    when '*'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add
  print "Type in employee name: "; employee_name = gets.chomp
  employee = Employee.new({:name => employee_name})
  employee.save
  puts "'#{employee_name}' has been added."
end

def list
  puts "Here is the list of employees:"
  employees = Employee.all
  employees.each { |employee| puts employee.name }
end

menu
