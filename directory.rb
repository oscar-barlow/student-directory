# # let's put all the students into an array of hashes
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november},
# ]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
  students = []
  # get the first name
  name = gets.chomp

  origin = ''
  until !origin.empty?
    puts "What's their country of origin?"
    origin = gets.chomp
  end

  cohort = ''
  until !cohort.empty?
    puts "What cohort are their joining?"
    cohort = gets.chomp
  end
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort.downcase.to_sym, origin: origin}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

# methods for printing student info
def print_header
  line_width = `/usr/bin/env tput cols`.to_i
  puts "The students of Villains Academy".center(line_width), "-------------".center(line_width)
end

def print(students)
  line_width = `/usr/bin/env tput cols`.to_i
  # until the value returned by indexing the array is nil, print stuff
  index_no = 0
  until students[index_no] == nil
    puts "#{index_no + 1}. #{students[index_no][:name]} (#{students[index_no][:cohort]} cohort), from: #{students[index_no][:origin]}".center line_width
    index_no +=1
  end

  # students.each_with_index do |student, index|
  #     puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if ("#{student[:name]}"[0] == "D") && (student[:name].length < 12)
  # end
end

def print_footer(names)
  line_width = `/usr/bin/env tput cols`.to_i
  puts "Overall, we have #{names.count} great students".center line_width
end

# nothing happens til we call the methods
students = input_students
print_header
print(students)
print_footer(students)
