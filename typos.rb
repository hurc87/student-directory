@students = [] # an empty array accessible to all methods

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name],student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
  @students << {name: name, cohort: :november}
  puts "Now we have #{@students.count} students"
  # get another name from the user
  name = gets.chomp
  end
  # return the array of students
  @students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "``-------------``"
end

def print_students_list()
  if @students.empty?
    puts "There is noone on the list"
  else
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def print_menu
  puts "1. Input the input_students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" #9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

run interactive_menu
