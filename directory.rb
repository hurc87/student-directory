def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while name is not empty, repeat the code
  while !name.empty? do
    puts "Country of birth"
    country = gets.chomp
    puts "Which Cohort"
    cohort_choice = gets.chomp
    cohort_choice.to_sym
    if cohort_choice.empty?
    cohort_choice = "Unknown"
    end
    #add the student hash to the array
    students << {name: name, cohort: cohort_choice, country_of_birth: country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of input_students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "Which cohort would you like to view?"
  month = gets.chomp
  students.each.with_index do |student, index|
    while student[:name].length < 12 && student[:cohort].include?(month)
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort), Country of birth:#{student[:country_of_birth]} "
    break
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
