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
    puts "1:  add an employee"
    puts "2:  list employees"
    puts "3:  create a division"
    puts "4:  list divisions"
    puts "5:  add employee to a division "
    puts "9:  exit"
    choice = gets.chomp
    case choice
    when '1' then add
    when '2' then list_employees
    when '3' then create_division
    when '4' then list_divisions
    when '5' then add_to_division
    when '9' then puts "Good-bye!"
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

def list_employees
  puts "Here is the list of employees:"
  employees = Employee.all
  employees.each { |employee| puts employee.name }
end

def create_division
  print "Name the division: "; division_name = gets.chomp
  new_division = Division.new({:name => division_name})
  new_division.save
  puts "'#{division_name}' has been added."
end

def list_divisions
  puts "Here is the list of divisions:"
  divisions = Division.all
  divisions.each { |division| puts division.name }
end

def add_to_division
  list_employees
  print "Choose the employee: "; user_input = gets.chomp
  selected_employee = Employee.find_or_create_by(name: user_input)
  list_divisions
  print "Choose the division: "; user_input = gets.chomp
  selected_division = Division.find_or_create_by(name: user_input)

end

menu
