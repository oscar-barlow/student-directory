student_count = 11
# let's put all the students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]
# and the print them
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# finally we print the total
puts "Overall, we have #{students.size} great students"
