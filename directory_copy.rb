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
    name= gets.gsub!("\n", "")
    puts "Add the country of the student:"
    country = gets.chomp
    cohort = ""
    
    while cohort.empty? do
      puts "Add the cohort of the student:"
      cohort = gets.chomp
      if cohort == ""
          cohort = "November"
          break
      elsif (cohort).capitalize != "January" and (cohort).capitalize != "February" and (cohort).capitalize != "March" and (cohort).capitalize != "April" and (cohort).capitalize != "May" and (cohort).capitalize != "June" and (cohort).capitalize != "July" and (cohort).capitalize != "August" and (cohort).capitalize != "September" and (cohort).capitalize != "October" and (cohort).capitalize != "November" and (cohort).capitalize != "December"
        puts "Please, enter a valid cohort"
        cohort = ""
      end
    end  
    while !name.empty? do
        students << {name: name, cohort: cohort, country: country}
        if students.count == 1
            puts "Now we have 1 student."
        else
          puts "Now we have #{students.count} students."
        end
        puts "Add the name of the student:"
        name= gets.chomp
        if !name.empty?
          puts "Add the country of the student:"
          country = gets.chomp
        end
    cohort = ""
    while cohort.empty? do
      puts "Add the cohort of the student:"
      cohort = gets.chomp
      if cohort == ""
          cohort = "November"
          break
      elsif (cohort).capitalize != "January" and (cohort).capitalize != "February" and (cohort).capitalize != "March" and (cohort).capitalize != "April" and (cohort).capitalize != "May" and (cohort).capitalize != "June" and (cohort).capitalize != "July" and (cohort).capitalize != "August" and (cohort).capitalize != "September" and (cohort).capitalize != "October" and (cohort).capitalize != "November" and (cohort).capitalize != "December"
        puts "Please, enter a valid cohort"
        cohort = ""
      end
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