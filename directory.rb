require 'CSV'
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
  # get the first name
  student_details = validate_student_details

  while !student_details.empty? do
    count = 0
    name = student_details[0]
    cohort = student_details[1]
    students_shovel(name, cohort) # <--- this line!
    puts "Enter another student:"
    student_details = validate_student_details
    count += 1
  end
  puts "#{count} students input successfully"
end

def validate_student_details
  name = STDIN.gets.chomp
  student_details = Array.new
  if !name.empty?
    student_details << name
    puts "What cohort are they in?"
    cohort = STDIN.gets.chomp.downcase
    cohort = validate_cohort(cohort)
    student_details << cohort
  end
  student_details
end


def validate_cohort(cohort)
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :august, :september, :october, :november, :december]
  until months.include? cohort.to_sym
    puts "I'm sorry, there seems to be a problem. What cohort are they in?"
    puts "Please check the spelling carefully."
    cohort = STDIN.gets.chomp.downcase
  end
  cohort
end

# methods for printing student info
def print_header
  puts "The students of Villains Academy", "-------------"
end

def print(students)
  cohorts = students.collect { |i| i[:cohort] }.uniq.sort
  cohorts.each do |c|
    puts "*** #{c.capitalize} Cohort: ***"
      students.each do |i|
        puts i[:name] if (i[:cohort] == c)
      end
    puts ''
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
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load students from a file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then script_exit
    else "I don't know what you mean?"
  end
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end


# ------------------------ #
#                          #
#      Read and write      #
#    @students to file     #
#                          #
# ------------------------ #

def get_file
  puts "What file?"
  user_file = STDIN.gets.chomp
  user_file
end

def save_students
  CSV.open("./#{get_file}", "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "#{@students.count} students saved to file.", ''
end

def students_shovel(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def load_students(filename = get_file)
  @students = [] # empty current students from @students variable
  CSV.foreach("./#{filename}") do |row|
    name, cohort = row[0], row[1]
    students_shovel(name, cohort)
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    puts "No students loaded from file"
  else
    if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} students from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist."
      script_exit
    end
  end
end

def script_exit
  puts "Exiting"
  exit
end

try_load_students
interactive_menu
