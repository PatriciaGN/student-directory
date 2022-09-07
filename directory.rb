# ARGV array initialised automatically

@students = [] # An empty array accessible to all methods (instance variable)
@current_cohorts = [].sort

@cohorts = ["January", "February", "March", "April", 
  "June", "July", "August", "September", "October", "November", "December"
  ]


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
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
      name= STDIN.gets.gsub!("\n", "")  # As we have a loaded file in our program, we need to indicate "gets" to read from keyboard (STDIN), instead of the file.
      if name.empty?
        break
      else
      puts "Add the country of the student:"
      country = STDIN.gets.chomp
      puts "Add the cohort of the student (if left blank, it will default to our November cohort):"
      cohort = STDIN.gets.chomp.to_sym
      end
      while !@cohorts.include?(cohort.capitalize) and cohort != ""
        puts "Please, enter a valid cohort"
        cohort = STDIN.gets.chomp
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
    @students.map do |x|
      unless @current_cohorts.include?(x[:cohort])
        @current_cohorts << x[:cohort]
      end
      counter +=1
    end
    counter = 1
    @current_cohorts.each do |cohort|
      puts cohort
      @students.each do |student|
        if student[:cohort] == cohort
        puts ("#{counter}. #{student[:name]} from #{student[:country]} (#{student[:cohort]} cohort)").center(50)
      counter += 1
        end
      end
    end
=begin
    counter = 0
    @students.each do |student|
      puts ("#{counter}. #{student[:name]} from #{student[:country]} (#{student[:cohort]} cohort)").center(50)
      counter += 1
    end
=end
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

def load_students (filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, country, cohort = line.chomp.split(",")
    @students << {name: name, country: country, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

#To run the program and load the file, we need to pass it an argument through the command line -> ruby directory.rb students.csv
try_load_students

interactive_menu