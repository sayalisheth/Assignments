puts "Enter number"
no=gets.chomp.to_i
flag=0
if no==0
	puts "please enter valid no"

elsif no==1
	puts "one is nither prime nor composite"

else
	for i in 2..no/2 do
 		if no%i==0
 			flag=1
		end
	end
	if flag==1
		puts "No is not prime"
	else
		puts "No is prime"
	end
end
