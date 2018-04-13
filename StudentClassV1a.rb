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

    attr_accessor :first_name, :last_name, :country_of_birth, :birthday, :course, :course_start_date, :course_month_count

    # Getters
    #def country_of_birth
    #    @country_of_birth # Is NIL if never been set
    #end

    #def course_start_date
    #    @course_start_date # Is NIL if never been set
    #end

    def course_end_date
        start_date = course_start_date
        #start_date >> 6 # Advance 6 months
        start_date.next_month(@course_month_count) # Advance 6 months
    end

    # Setters
    #def country_of_birth=(country_of_birth)
    #    @country_of_birth = country_of_birth
    #end

    #def birthday=(date)
    #    @birthday = date
    #end

end

class Course
    # Has
    # - name
    # - course_code
    # - start_date
    # - month_count
    # - end_date

    attr_accessor :name, :course_code
end

# Create Fast Track course object
fast_track = Course.new
fast_track.name = 'Diploma of IT'
fast_track.course_code = 'FT004'

# Make architecture course object
architecture = Course.new
architecture.name = 'Bachelor of Architecture'
architecture.course_code = 'Ar004'

# Make student object Mary
mary = Student.new('Mary', 'Poppins')
mary.country_of_birth = 'New Zealand' # Same as writing mary.country_of_birth=('New Zealand')
mary.course_start_date = Date.new(2017, 9, 1)
mary.course_month_count = 6
mary.course = fast_track
puts "Mary's course ends on:"
puts mary.course_end_date

# Make student object don
don = Student.new('Donald', 'Bradman')
don.country_of_birth = 'Australia'
don.course_start_date = Date.new(2017, 9, 1)
don.course_month_count = 6
don.course = fast_track
puts "Donald's course ends on:"
puts don.course_end_date
