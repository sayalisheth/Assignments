puts "Enter grades"
grade=gets.chomp.to_i
if grade==0
puts "Please enter valid grade"
else
 if grade>=1 and grade<=5
 puts "elementary"
 elsif grade>=6 and grade<=8
 puts "middle school"
 elsif grade>=9 and grade<=12
 puts "high school"
 else
 puts "college"
 end
end
