

@students = [] # An empty array accessible to all methods (instance variable)

@cohorts = ["January", "February", "March", "April", 
  "June", "July", "August", "September", "October", "November", "December"
  ]

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      return exit
    else
      puts "I don't know what you mean, try again"
  end
end
  
  
def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
    print_header
    print_student_list(@students)
    print_footer(@students)
end

def input_students
    name = "Pepe"
    while !name.empty? do
      puts "Please enter the names of the students"
      puts "To finish, just hit return twice"
      puts "Add the name of the student:"
      name= gets.gsub!("\n", "")
      if name.empty?
        break
      else
      puts "Add the country of the student:"
      country = gets.chomp
      puts "Add the cohort of the student (if left blank, it will default to our November cohort):"
      cohort = gets.chomp
      end
      while !@cohorts.include?(cohort.capitalize) and cohort != ""
        puts "Please, enter a valid cohort"
        cohort = gets.chomp
      end
      if cohort == ""
        cohort = "November"
      end
      @students << {name: name, cohort: cohort, country: country}
      if @students.count == 1
        puts "Now we have 1 student."
      else
        puts "Now we have #{@students.count} students."
      end
    end
end

def print_header
  puts ("The students of Villains Academy").center(50)
  puts ("-------------------").center(50)
end

def print_student_list(students)
    counter = 0
    while counter < @students.length
      puts ("#{counter}. #{@students[0 + counter][:name]} from #{@students[0 + counter][:country]} (#{@students[0 + counter][:cohort]} cohort)").center(50)
      counter += 1
    end
end

def print_footer(names)
  puts (("Overall, we have #{names.count} great students")).center(50)
end

def save_students
    file = File.open("students.csv", "w")
    @students.each do |student|
        student_data = [student[:name], student[:country], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, country, cohort = line.chomp.split(",")
    @students << {name: name, country: country, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu