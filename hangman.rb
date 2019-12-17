def find_ind(word,let)
	i = 0
	all = []
	while(i!=word.length)
		if word[i]==let
 			all << i
			i+=1
		else
			i+=1
		end
	end
	all
end




words=["JOSH","SOFTWARE","PIZZA","PASTA"]
curr_word = words[rand(words.length)]
puts curr_word
count=5
new_word=""
letters_enter=""
for i in 1..curr_word.length do
	new_word=new_word+"_"
end

#puts new_word
while (new_word!=curr_word and count!=0) do
	puts "You have #{count} chance"
	puts "Enter any latter"
	l=gets.chomp.upcase
	puts l
	if letters_enter.include? l
		puts "letter already enter please enter new letter\n\n"
	else
		letters_enter+=l
	
		if curr_word.include? l

			index_all=find_ind(curr_word,l)
			index_all.each do|a| 
				new_word[a]=l
			end
			for i in 0..new_word.length do 
			 	print " #{new_word[i]}" 
			end
			puts"\n\n"
		else
			count-=1
		end
	end
	if(count==0)
		puts "\n\n****YOU LOOS!!!****\n\n"
	end
	
	if(new_word==curr_word)
		puts "\n\n****YOU WON!!!****\n\n"
	end
end
		


