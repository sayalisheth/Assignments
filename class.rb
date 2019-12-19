class Student
	attr_reader :name
	attr_writer :name
	attr_accessor :roll_no
	attr_accessor :age

	@@count = 0
  def initialize(n,a)
   	@@count += 1
    puts "Object is created"
    @name = n
    @roll_no = @@count
    @age = a
   end

def self.total_student_count
	puts "Total no of students : #{@@count}"
end

public
def show_name
	puts "name : #{name}"
end

#private
def show_rollno
	puts "Roll no. : #{roll_no}"
end

#protected
def show_age
	puts "Age : #{age}"
end

end
s1 = Student.new("Sayali", 23)
s1.show_name
s1.show_rollno
s1.show_age


s2 = Student.new("Kajal", 23)
s2.show_name
s2.show_rollno
s2.show_age


Student.total_student_count


