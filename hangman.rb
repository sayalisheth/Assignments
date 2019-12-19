chances = 5
stages = 0
words=["JOSH", "SOFTWARE", "PIZZA", "PASTA", "LAPTOP", "MOBILE", "SCHOOL", "BOTTEL", "BUS", "CAT", "QUESTION", "PROGRAMMER", "KING"]


def find_index(word, character)
  index = 0
	all_index = []
	while(index != word.length)
		if word[index] == character
 			all_index << index
			index += 1
		else
			index += 1
		end
	end
	all_index
end

def print_new_word(word)
		for i in 0..word.length do 
			print " #{word[i]}" 
		end
end

def check_word(curr_word, chances)
	new_word = ""
	letters_enter = ""

	for i in 1..curr_word.length do
		new_word = new_word + "_"
	end

	while (new_word != curr_word and chances != 0) do
		puts "You have #{chances} chances"
		print_new_word(new_word)
		puts "\n\nEnter any letter"
		letter = gets.chomp.upcase
		puts letter

		if letters_enter.include? letter
			puts "\nletter already entered please enter new letter\n\n"
		else
			letters_enter += letter
		 
			if curr_word.include? letter

				index_all = find_index(curr_word, letter)
				index_all.each do|a| 
					new_word[a] = letter
				end
				
			else
				chances -= 1
			end
		end

		if(chances == 0)
			print_new_word(new_word)
			puts "\n\n****YOU LOOSE!!!****\n\nword is :#{curr_word}\n\n"
			exit
		end
		
		if(new_word == curr_word)
			print_new_word(new_word)
			puts "\n\n****Your Guess is Correct!!!****\n\n"
		end
		end
		chances
end

while(stages < 5)
	stages += 1 
	puts "stage : #{stages}"

	curr_word = words[rand(words.length)]
	
	chances = check_word(curr_word, chances)
end		


