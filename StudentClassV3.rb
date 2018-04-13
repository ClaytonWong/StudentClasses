require 'date' # To use the date class

class Student
# - first_name: string
# - last_name: string
# - country_of_birth: string
# - birthday: Date
# - courses: instances of course class in an array
# - teacher: instance of teacher class
#
#   NOT USED:
# - course_start_date: date
# - course_month_count: integer

    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
    end

    attr_accessor :first_name, :last_name, :country_of_birth, :birthday, :courses, :teacher
                    #:course_start_date, :course_month_count

    def course_end_date
        start_date = course_start_date
        #start_date >> 6 # Advance 6 months
        start_date.next_month(@course_month_count) # Advance 6 months
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

    attr_accessor :name, :course_code, :start_date, :month_count

    def end_date
        start_date = @start_date
        start_date.next_month(@month_count) # Advance by n months
    end
end

course_list = [] # Declare an array of instances of the course class

# Create Fast Track course object
fast_track = Course.new
fast_track.name = 'Diploma of IT'
fast_track.course_code = 'FT004'
fast_track.start_date = Date.new(2017, 9, 1)
fast_track.month_count = 6

# Create architecture course object
architecture = Course.new
architecture.name = 'Bachelor of Architecture'
architecture.course_code = 'Ar004'
architecture.start_date = Date.new(2018, 9, 1)
architecture.month_count = 36

# Put fast_track and architecture courses into course_list
course_list << fast_track
course_list << architecture

# Check contents of course list
puts course_list[0].name
puts course_list[1].name

# Create student object Donald
don = Student.new('Donald', 'Bradman')
don.country_of_birth = 'Australia'

# Assign course_list to Donald's list of courses
don.courses = course_list

# Check Donald's course list
puts "Donal's first course: #{don.courses[0].name}"
puts "Donal's second course: #{don.courses[1].name}"