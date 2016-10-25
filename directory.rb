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
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :august, :september, :october, :november, :december]
  # get the first name
  name = gets.chomp

  if !name.empty?
    puts "What cohort are they in?"
    cohort = gets.chomp.downcase.to_sym
    until months.include? cohort
      puts "I'm sorry, there seems to be a problem. What cohort are they in?"
      puts "Please check the spelling carefully."
      cohort = gets.chomp.downcase.to_sym
    end
  end

  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    if !name.empty?
      puts "What cohort are they in?"
      cohort = gets.chomp.downcase.to_sym
      until months.include? cohort
        puts "I'm sorry, there seems to be a problem. What cohort are they in?"
        puts "Please check the spelling carefully."
        cohort = gets.chomp.downcase.to_sym
      end
    end
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
  cohorts = students.collect { |i| i[:cohort] }.uniq.sort

  # find the items in the student array whose cohort: value matches c
  # print them
  cohorts.each do |c|
    puts "#{c.capitalize} Cohort:"
      students.each do |i|
        puts i[:name] if (i[:cohort] == c)
      end
  end

end

def print_footer(names)
  line_width = `/usr/bin/env tput cols`.to_i
  case names.count
    when 0 then puts "We don't have any students".center line_width
    when 1 then puts "We have 1 great student".center line_width
    else puts "Overall, we have #{names.count} great students".center line_width
  end
end

# nothing happens til we call the methods
students = input_students
print_header
print(students)
print_footer(students)
