chance=5
stage=0
words=["JOSH","SOFTWARE","PIZZA","PASTA","LAPTOP","MOBILE","SCHOOL","BOTTEL","BUS","CAT","QUESTION","PROGRAMMER","KING"]


def find_index(word,let)
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


def check_word(curr_word,chance)
	#puts new_word
	new_word=""
	letters_enter=""

	for i in 1..curr_word.length do
		new_word=new_word+"_"
	end


	while (new_word!=curr_word and chance!=0) do
		puts "You have #{chance} chance"
		for i in 0..new_word.length do 
			print " #{new_word[i]}" 
		end
		puts"\n\n"
		puts "Enter any latter"
		l=gets.chomp.upcase
		puts l

		if letters_enter.include? l
			puts "letter already enter please enter new letter\n\n"
		else
			letters_enter+=l
		
			if curr_word.include? l

				index_all=find_index(curr_word,l)
				index_all.each do|a| 
					new_word[a]=l
				end
				
			else
				chance-=1
			end
		end

		if(chance==0)
			for i in 0..new_word.length do 
				print " #{new_word[i]}" 
			end
			puts "\n\n****YOU LOOS!!!****\n\nword is :#{curr_word}\n\n"
			exit
		end
		
		if(new_word==curr_word)
			for i in 0..new_word.length do 
				print " #{new_word[i]}" 
			end
			puts "\n\n****You Guess Correct!!!****\n\n"
		end
		end
		chance
end



while(stage<5)
	stage+=1
	puts "stage : #{stage}"

	curr_word = words[rand(words.length)]
	
	chance=check_word(curr_word,chance)
end		


