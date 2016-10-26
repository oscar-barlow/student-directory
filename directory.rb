@students = []

# ------------------------ #
#                          #
# Methods for printing to  #
# @students                #
#                          #
# ------------------------ #

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create empty array
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
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
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
end

# methods for printing student info
def print_header
  puts "The students of Villains Academy", "-------------"
end

def print(students)
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
  case names.count
    when 0 then puts "We don't have any students"
    when 1 then puts "We have 1 great student"
    else puts "Overall, we have #{names.count} great students"
  end
end

# ------------------------ #
#                          #
#     Interactive Menu     #
#                          #
# ------------------------ #

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "9" then exit
    else
      "I don't know what you mean?"
    end
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

# nothing happens til we call the methods
interactive_menu

# ------------------------ #
#                          #
#  Save @students to file  #
#                          #
# ------------------------ #

def save_students
  # open file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
