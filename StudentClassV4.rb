require 'date' # To use the date class

class Student
# - first_name: string
# - last_name: string
# - country_of_birth: string
# - birthday: Date
# - courses: instances of course class in an array
# - teacher: instance of teacher class

    def initialize(first_name: nil, last_name: nil, country_of_birth: nil, birthday: Date.today, courses: nil, teacher: nil)
        @first_name = first_name
        @last_name = last_name
        @country_of_birth = country_of_birth
        @birthday = birthday
        @courses = []
        @teacher = teacher
    end

    attr_accessor :first_name, :last_name, :country_of_birth, :birthday, :courses, :teacher
    
    def add_course(course)
        unless courses.include? course # Check if student already enrolled in course
            @courses.push(course) # If not, put course in courses list
        else # Else say student already enrolled
            puts "Error from add_course method: #{first_name} #{last_name} already enrolled in #{course.name}"
        end
    end

    def course_end_date
        start_date = course_start_date
        #start_date >> 6 # Advance 6 months
        start_date.next_month(@course_month_count) # Advance 6 months
    end

    def remove_course(course)
        index = @courses.index(course)
        unless index == nil
            @courses.delete_at(index)
        else
            puts "Error from remove_student method: #{student.first_name} #{student.last_name} not enrolled in #{name}"
        end
    end
end

class Teacher
    # - first_name: string
    # - last_name: string
    # - country_of_birth: string
    # - birthday: Date
    # - specialisation: string

    attr_accessor :first_name, :last_name, :country_of_birth, :birthday, :specialisation    
end

class Course
    # Has
    # - name
    # - course_code
    # - start_date
    # - month_count
    # - end_date

    attr_accessor :name, :course_code, :start_date, :month_count, :students

    def initialize
        @students = []
    end

    def end_date
        start_date = @start_date
        start_date.next_month(@month_count) # Advance by n months
    end

    def add_student(student)
        unless students.include? student # Check if student already enrolled in course
            @students << student          # If not, put student in list
            student.add_course(self)
        else # Else say student already enrolled
            puts "Error from add_student method: #{student.first_name} #{student.last_name} already enrolled in #{name}"
            student.add_course(self)
        end
    end

    def remove_student(student)
        index = @students.index(student)
        unless index == nil
            @students.delete_at(index)
            student.remove_course(self)
        else
            puts "Error from remove_student method: #{student.first_name} #{student.last_name} not enrolled in #{name}"
        end
    end
end

# Create Fast Track course object
fast_track = Course.new
fast_track.name = 'Diploma of IT'
fast_track.course_code = 'FT004'
fast_track.start_date = Date.new(2017, 9, 1)
fast_track.month_count = 6

# Create architecture course object
architecture = Course.new
architecture.name = 'Bachelor of Architecture'
architecture.course_code = 'AR004'
architecture.start_date = Date.new(2018, 9, 1)
architecture.month_count = 36

# Create science course subject
science = Course.new
science.name = 'Bachelor of science'
science.course_code = 'SC004'
science.start_date = Date.new(2018, 9, 1)
science.month_count = 36

# Create Mary student object
mary = Student.new
mary.first_name = 'Mary'
mary.last_name = 'Poppins'
mary.country_of_birth = 'New Zealand' # Same as writing mary.country_of_birth=('New Zealand')

# Add Mary as student of science
science.add_student(mary)
puts "First science student enrolled: #{science.students[0].first_name.inspect}" # Check science student enrollment (1st student only)
puts "Mary's first course: #{mary.courses[0].name.inspect}" # Check Mary's first course

# Checking else sections of add_student and add_course methods in course and student classes respectively
science.add_student(mary)

# Remove Mary from science course
science.remove_student(mary)

# Check science object to see if Mary is a student
if science.students.include? mary
    puts 'Mary enrolled in science'
else
    puts 'Mary not enrolled in science'
end

# Check Mary's course list to see if science is in it
if mary.courses.include? science
    puts "Mary says: I'm enrolled in science"
else
    puts "Mary says: I'm not enrolled in science"
end