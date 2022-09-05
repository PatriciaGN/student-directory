=begin
students = [
 {name: "Dr. Hannibal Lecter", cohort: :november},
 {name: "Darth Vader", cohort: :november},
 {name: "Nurse Ratched", cohort: :november},
 {name: "Michael Corleone", cohort: :november} ,
 {name: "Alex DeLarge", cohort: :november},
 {name: "The Wicked Witch of the West", cohort: :november},
 {name: "Terminator", cohort: :november},
 {name: "Freddy Krueger", cohort: :november},
 {name: "The Joker", cohort: :november},
 {name: "Joffrey Baratheon", cohort: :november},
 {name: "Norman Bates", cohort: :november}
]
=end


def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    puts "Add the name of the student:"
    name= gets.chomp
    puts "Add the country of the student:"
    country = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :november, country: country}
        puts "Now we have #{students.count} students"
        puts "Add the name of the student:"
        name= gets.chomp
        if !name.empty?
          puts "Add the country of the student:"
          country = gets.chomp
        end
    end
    students
end

def print_header
  puts ("The students of Villains Academy").center(50)
  puts ("-------------------").center(50)
end

def print(students)
    counter = 0
    while counter < students.length
      puts ("#{counter}. #{students[0 + counter][:name]} from #{students[0 + counter][:country]} (#{students[0 + counter][:cohort]} cohort)").center(50)
      counter += 1
    end
end

def print_footer(names)
  puts (("Overall, we have #{names.count} great students")).center(50)
end

students = input_students
print_header
print(students)
print_footer(students)